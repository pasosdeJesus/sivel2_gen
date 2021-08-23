class CambiaRangoedadSinrango < ActiveRecord::Migration[6.1]
  def change
    Sivel2Gen::Rangoedad.update_all 'nombre=rango' 
    remove_column :sivel2_gen_rangoedad, :rango
  end
end
