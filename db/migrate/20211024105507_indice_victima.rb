class IndiceVictima < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE INDEX sivel2_gen_victima_id_rangoedad_ind ON
              sivel2_gen_victima (id_rangoedad);
    SQL
  end
  def down
    execute <<-SQL
      DROP INDEX sivel2_gen_victima_id_rangoedad_ind;
    SQL
  end
end
