class CreateActividadarea < ActiveRecord::Migration
  def change
    create_table :actividadarea do |t|
      t.string :nombre, limit: 500
      t.string :observaciones, limit: 5000
      t.date :fechacreacion
      t.date :fechadeshabilitacion

      t.timestamps
    end
  end
end
