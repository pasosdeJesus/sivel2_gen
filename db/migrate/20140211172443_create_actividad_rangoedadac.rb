class CreateActividadRangoedadac < ActiveRecord::Migration[4.2]
  def change
    create_table :actividad_rangoedadac do |t|
      t.references :actividad, index: true
      t.references :rangoedadac, index: true
      t.integer :ml
      t.integer :mr
      t.integer :fl
      t.integer :fr

      t.timestamps
    end
  end
end
