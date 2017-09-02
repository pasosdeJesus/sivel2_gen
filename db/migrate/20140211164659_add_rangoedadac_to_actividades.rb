class AddRangoedadacToActividades < ActiveRecord::Migration[4.0]
  def change
    add_reference :actividad, :rangoedadac, index: true
  end
end
