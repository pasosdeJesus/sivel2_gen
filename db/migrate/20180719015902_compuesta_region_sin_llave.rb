class CompuestaRegionSinLlave < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_region DROP CONSTRAINT IF EXISTS 
     caso_region_pkey;
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_region ADD CONSTRAINT 
     caso_region_pkey PRIMARY KEY (id_region, id_caso);
    SQL
  end
end
