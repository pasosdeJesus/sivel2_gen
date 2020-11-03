class AgregaPersonaALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :sivel2_gen_lugarpreliminar, :id_persona, :integer
    add_foreign_key :sivel2_gen_lugarpreliminar, :sip_persona, column: :id_persona
  end
end
