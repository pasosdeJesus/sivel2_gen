class Catpresp < ActiveRecord::Migration[5.1]
  def up
    remove_column :sivel2_gen_caso_categoria_presponsable, 
      :id_tviolencia
    remove_column :sivel2_gen_caso_categoria_presponsable, 
      :id_supracategoria
    remove_column :sivel2_gen_caso_categoria_presponsable, 
      :id_caso
    remove_column :sivel2_gen_caso_categoria_presponsable, 
      :id_presponsable
  end
  
  def down
    add_column :sivel2_gen_caso_categoria_presponsable, 
      :id_tviolencia, :character
    add_column :sivel2_gen_caso_categoria_presponsable, 
      :id_supracategoria, :integer
    execute <<-SQL
      UPDATE sivel2_gen_caso_categoria_presponsable 
        SET id_tviolencia=s.id_tviolencia, 
          id_supracategoria=c.supracategoria_id 
        FROM sivel2_gen_categoria AS c
          JOIN sivel2_gen_supracategoria AS s 
            ON c.supracategoria_id=s.id
        WHERE sivel2_gen_caso_categoria_presponsable.id_categoria=c.id
    SQL
    add_column :sivel2_gen_caso_categoria_presponsable, 
      :id_caso, :integer
    add_column :sivel2_gen_caso_categoria_presponsable, 
      :id_presponsable, :integer
    execute <<-SQL
      UPDATE sivel2_gen_caso_categoria_presponsable 
        SET id_caso=cp.id_caso
          id_presponsable=cp.id_presponsable
        FROM sivel2_gen_caso_presponsable AS cp
        WHERE id_caso_presponsable=cp.id
    SQL

  end
end
