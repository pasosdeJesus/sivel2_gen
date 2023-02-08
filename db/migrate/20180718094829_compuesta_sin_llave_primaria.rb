class CompuestaSinLlavePrimaria < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_frontera DROP CONSTRAINT IF EXISTS 
     caso_frontera_pkey;
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_frontera ADD CONSTRAINT 
     caso_frontera_pkey PRIMARY KEY (id_frontera, id_caso);
    SQL
  end
end
