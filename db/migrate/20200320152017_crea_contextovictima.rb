class CreaContextovictima < ActiveRecord::Migration[6.0]
  def up
    create_table :sivel2_gen_contextovictima do |t|
      t.string :nombre, limit: 100
      t.string :observaciones, limit: 5000
      t.date :fechacreacion
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
  end

  def down
    drop_table :contextovictima
  end
end
