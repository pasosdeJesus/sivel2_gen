class AgregaUbicacionpreALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :sivel2_gen_lugarpreliminar, :ubicacionpre_id, :integer
    add_foreign_key :sivel2_gen_lugarpreliminar, :sip_ubicacionpre, column: :ubicacionpre_id
  end
end
