class RemoveActividadFromActividad < ActiveRecord::Migration[4.0]
  def change
    remove_column :actividad, :actividad, :string
  end
end
