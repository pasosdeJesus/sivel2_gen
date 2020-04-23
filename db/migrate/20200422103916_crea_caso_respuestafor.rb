class CreaCasoRespuestafor < ActiveRecord::Migration[6.0]
  def change
    create_join_table :sivel2_gen_caso, :mr519_gen_respuestafor, {
      table_name: 'sivel2_gen_caso_respuestafor'
    }
    add_foreign_key :sivel2_gen_caso_respuestafor, :sivel2_gen_caso
    add_foreign_key :sivel2_gen_caso_respuestafor, :mr519_gen_respuestafor
    rename_column :sivel2_gen_caso_respuestafor, :sivel2_gen_caso_id, 
      :caso_id
    rename_column :sivel2_gen_caso_respuestafor, 
      :mr519_gen_respuestafor_id, :respuestafor_id
  end
end
