class CreateVisual < ActiveRecord::Migration[6.0]
  def change
    create_table :sivel2_gen_visual do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.integer :r_nav_ini
      t.integer :g_nav_ini
      t.integer :b_nav_ini
      t.integer :r_nav_fin
      t.integer :g_nav_fin
      t.integer :b_nav_fin
      t.integer :r_nav_fuente
      t.integer :g_nav_fuente
      t.integer :b_nav_fuente
      t.integer :r_list_back
      t.integer :g_list_back
      t.integer :b_list_back
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
  end
end
