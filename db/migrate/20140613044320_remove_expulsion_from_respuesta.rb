class RemoveExpulsionFromRespuesta < ActiveRecord::Migration
  def change
		remove_column :respuesta, :fechaexpulsion
  end
end
