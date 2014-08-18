class CreateRangoedadac < ActiveRecord::Migration
  def change
    create_table :rangoedadac do |t|
      t.string :nombre
      t.integer :limiteinferior
      t.integer :limitesuperior
      t.date :fechacreacion
      t.date :fechadeshabilitacion

      t.timestamps
    end
  end
end
