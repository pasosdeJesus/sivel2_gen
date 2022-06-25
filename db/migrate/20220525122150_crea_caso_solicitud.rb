class CreaCasoSolicitud < ActiveRecord::Migration[7.0]
  def change
    create_table :sivel2_gen_caso_solicitud do |t|
      t.integer :caso_id, null: false
      t.integer :solicitud_id, null: false
      t.index :caso_id
      t.index :solicitud_id
    end
    add_foreign_key :sivel2_gen_caso_solicitud, 
      :sivel2_gen_caso, column: :caso_id
    add_foreign_key :sivel2_gen_caso_solicitud, :sip_solicitud, 
      column: :solicitud_id
  end
end
