class AgregaUbicaespecificaALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :sivel2_gen_lugarpreliminar, :ubicaespecifica, :text, limit: 5000 
  end
end
