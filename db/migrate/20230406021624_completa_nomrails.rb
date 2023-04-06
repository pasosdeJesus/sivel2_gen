class CompletaNomrails < ActiveRecord::Migration[7.0]
  def up
    if Msip::Ubicacion.columns.map(&:name).include?("id_caso")
      rename_column(:msip_ubicacion, :id_caso, :caso_id)
    end
  end
  def down
    if Msip::Ubicacion.columns.map(&:name).include?("caso_id")
      rename_column(:msip_ubicacion, :caso_id, :id_caso)
    end
  end
end
