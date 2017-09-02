class AddTiempoToIntervalo < ActiveRecord::Migration[4.2]
  def change
    add_column :intervalo, :created_at, :datetime
    add_column :intervalo, :updated_at, :datetime
  end
end
