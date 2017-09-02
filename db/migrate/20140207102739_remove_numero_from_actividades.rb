class RemoveNumeroFromActividades < ActiveRecord::Migration[4.0]
  def change
    remove_column :actividad, :numero, :integer
  end
end
