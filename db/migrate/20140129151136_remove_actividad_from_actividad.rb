class RemoveActividadFromActividad < ActiveRecord::Migration[4.2]
  def change
    remove_column :actividad, :actividad, :string
  end
end
