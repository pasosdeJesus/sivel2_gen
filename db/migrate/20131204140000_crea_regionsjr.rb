class CreaRegionsjr < ActiveRecord::Migration[4.0]
  def change
    create_table :regionsjr do |t|
      t.string :nombre, limit: 500
      t.date :fechacreacion
      t.date :fechadeshabilitacion
    end
  end
end
