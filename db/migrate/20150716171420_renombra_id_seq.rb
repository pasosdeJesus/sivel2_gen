class RenombraIdSeq < ActiveRecord::Migration
  @@tablas = [
      #'actividadoficio',  
      'caso', 
      #'escolaridad', 
      #'estadocivil', 
      'etnia', 
      'filiacion', 
      'frontera',
      'iglesia', 
      'intervalo',
      #'maternidad', 
      'organizacion',
      'pconsolidado', 
      'presponsable', 
      'profesion', 
      'rangoedad',
      'region', 
      'sectorsocial', 
      'vinculoestado', 
  ]

  def up
    @@tablas.each do |t|
        execute <<-SQL
            ALTER SEQUENCE #{t + '_seq'}
                RENAME TO sivel2_gen_#{t + '_id_seq'};
        SQL
    end
  end

  def down
    @@tablas.each do |t|
        execute <<-SQL
            ALTER SEQUENCE sivel2_gen_#{t}_id_seq 
                RENAME TO #{t}_seq;
        SQL
    end
  end
end
