class CreateResagresion < ActiveRecord::Migration[5.0]
  def change
    create_table :sivel2_gen_resagresion do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
  end
end
