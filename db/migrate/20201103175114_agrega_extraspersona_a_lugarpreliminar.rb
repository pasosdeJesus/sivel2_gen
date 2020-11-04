class AgregaExtraspersonaALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :sivel2_gen_lugarpreliminar, :parentezco, :string
    add_column :sivel2_gen_lugarpreliminar, :grabacion, :boolean
    add_column :sivel2_gen_lugarpreliminar, :telefono, :string
  end
end
