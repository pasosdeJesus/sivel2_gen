class AddTiempoToIntervalo < ActiveRecord::Migration[4.0]
  def change
    add_column :intervalo, :created_at, :datetime
    add_column :intervalo, :updated_at, :datetime
  end
end
