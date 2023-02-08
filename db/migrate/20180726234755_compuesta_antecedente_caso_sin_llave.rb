# enconding: utf-8

class CompuestaAntecedenteCasoSinLlave < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_antecedente_caso DROP CONSTRAINT IF EXISTS 
        antecedente_caso_pkey;
    SQL
  end
  def down
    execute <<-SQL
     ALTER TABLE sivel2_gen_antecedente_caso ADD CONSTRAINT 
      antecedente_caso_pkey PRIMARY KEY (id_antecedente, id_caso);
    SQL
  end
end
