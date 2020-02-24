class RefVistaConscasTrasAgFecha < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      DROP MATERIALIZED VIEW sivel2_gen_conscaso CASCADE;
    SQL
  end
  def down
    execute <<-SQL
      DROP MATERIALIZED VIEW sivel2_gen_conscaso CASCADE;
    SQL
  end
end
