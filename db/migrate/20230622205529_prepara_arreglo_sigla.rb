class PreparaArregloSigla < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      DROP VIEW sivel2_gen_conscaso1 CASCADE;
    SQL
  end
  def down
    execute <<-SQL
      DROP VIEW sivel2_gen_conscaso1 CASCADE;
    SQL
  end
end
