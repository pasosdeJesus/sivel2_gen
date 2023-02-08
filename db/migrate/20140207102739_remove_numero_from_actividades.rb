class RemoveNumeroFromActividades < ActiveRecord::Migration[4.2]
  def change
    remove_column :actividad, :numero, :integer
  end
end
