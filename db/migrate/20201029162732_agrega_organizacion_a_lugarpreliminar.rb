class AgregaOrganizacionALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :sivel2_gen_lugarpreliminar, :organizacion, :string
  end
end
