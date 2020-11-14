class AgregaTipotestigoALugarpreliminar < ActiveRecord::Migration[6.0]
  def change
    add_column :sivel2_gen_lugarpreliminar, :tipotestigo_id, :integer
    add_foreign_key :sivel2_gen_lugarpreliminar, :sivel2_gen_tipotestigo, column: :tipotestigo_id
  end
end
