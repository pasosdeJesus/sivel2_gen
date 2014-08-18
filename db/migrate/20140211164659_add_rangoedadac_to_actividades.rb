class AddRangoedadacToActividades < ActiveRecord::Migration
  def change
    add_reference :actividad, :rangoedadac, index: true
  end
end
