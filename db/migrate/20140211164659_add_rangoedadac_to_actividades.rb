class AddRangoedadacToActividades < ActiveRecord::Migration[4.2]
  def change
    add_reference :actividad, :rangoedadac, index: true
  end
end
