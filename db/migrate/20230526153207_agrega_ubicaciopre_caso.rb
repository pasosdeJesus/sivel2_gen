class AgregaUbicaciopreCaso < ActiveRecord::Migration[7.0]
  def change
    create_table :sivel2_gen_caso_ubicacionpre do |t|
      t.integer :caso_id
      t.integer :ubicacionpre_id
    end
    add_foreign_key :sivel2_gen_caso_ubicacionpre, :sivel2_gen_caso,
      column: :caso_id
    add_foreign_key :sivel2_gen_caso_ubicacionpre, :msip_ubicacionpre,
      column: :ubicacionpre_id
  end
end
