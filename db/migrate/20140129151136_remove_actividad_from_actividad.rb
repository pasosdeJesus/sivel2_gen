class RemoveActividadFromActividad < ActiveRecord::Migration
  def change
    remove_column :actividad, :actividad, :string
  end
end
