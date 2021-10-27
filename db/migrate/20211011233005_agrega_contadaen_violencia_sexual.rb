class AgregaContadaenViolenciaSexual < ActiveRecord::Migration[6.1]
  def up
    categorias = ["ABORTO FORZADO", "ABUSO SEXUAL", "EMBARAZO FORZADO", "ESCLAVITUD SEXUAL", "ESTERILIZACIÓN FORZADA", "PROSTITUCIÓN FORZADA", "VIOLACIÓN"]
    categorias.each do |cat|
      [1, 2, 4, 5, 6, 8].each do |supra|
        cat_violencia = Sivel2Gen::Categoria.where(nombre: 'VIOLENCIA SEXUAL').where(supracategoria_id: supra)[0]
        if cat_violencia
          execute <<-SQL
            UPDATE sivel2_gen_categoria SET contadaen=#{cat_violencia.id} 
              WHERE supracategoria_id=#{supra} AND nombre='#{cat}'; 
          SQL
        end
      end
    end
  end

  def down
    categorias = ["ABORTO FORZADO", "ABUSO SEXUAL", "EMBARAZO FORZADO", "ESCLAVITUD SEXUAL", "ESTERILIZACIÓN FORZADA", "PROSTITUCIÓN FORZADA", "VIOLACIÓN"]
    categorias.each do |cat|
      [1, 2, 4, 5, 6, 8].each do |supra|
        execute <<-SQL
          UPDATE sivel2_gen_categoria SET contadaen=NULL 
            WHERE supracategoria_id=#{supra} AND nombre='#{cat}'; 
        SQL
      end
    end
  end
end
