class CambiaRangoedadSinrango < ActiveRecord::Migration[6.1]
  def up
    Sivel2Gen::Rangoedad.update_all 'nombre=rango' 
    remove_column :sivel2_gen_rangoedad, :rango
  end
  def down
    add_column :sivel2_gen_rangoedad, :rango
    Sivel2Gen::Rangoedad.update_all 'rango=nombre' 
  end
end
