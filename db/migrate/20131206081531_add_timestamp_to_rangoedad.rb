class AddTimestampToRangoedad < ActiveRecord::Migration[4.0]
  def change
    add_column :rangoedad, :created_at, :datetime
    add_column :rangoedad, :updated_at, :datetime
  end
end
