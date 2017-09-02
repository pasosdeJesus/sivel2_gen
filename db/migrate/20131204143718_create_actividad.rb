class CreateActividad < ActiveRecord::Migration[4.2]
  def change
    create_table :actividad do |t|
      t.integer :numero
      t.integer :minutos
      t.string :nombre, limit: 500
      t.string :objetivo, limit: 500
      t.string :proyecto, limit: 500
      t.string :resultado, limit: 500
      t.date :fecha
      t.string :actividad, limit: 500
      t.string :observaciones, limit: 5000

      t.timestamps
    end
  end
end
