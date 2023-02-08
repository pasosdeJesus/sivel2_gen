class MejoraRango2 < ActiveRecord::Migration[5.2]
  def change
    change_column_null :sivel2_gen_rangoedad, :rango, true
  end
end
