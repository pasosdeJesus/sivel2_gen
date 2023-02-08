class Renombrad75 < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
    UPDATE sivel2_gen_categoria SET nombre='RECLUTAMIENTO DE MENORES' 
      WHERE id=75;
    SQL
  end
  def down
  end
end
