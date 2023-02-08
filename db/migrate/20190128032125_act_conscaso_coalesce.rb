class ActConscasoCoalesce < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      DROP VIEW IF EXISTS sivel2_gen_conscaso1 CASCADE;
    SQL
  end
end
