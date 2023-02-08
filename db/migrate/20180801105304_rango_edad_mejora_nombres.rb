class RangoEdadMejoraNombres < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_rangoedad SET nombre=UPPER(rango);
    SQL
  end
  def down
  end
end
