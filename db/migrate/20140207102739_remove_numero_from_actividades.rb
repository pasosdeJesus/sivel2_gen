class RemoveNumeroFromActividades < ActiveRecord::Migration
  def change
    remove_column :actividad, :numero, :integer
  end
end
