class AddCreatedAtToCaso < ActiveRecord::Migration
  def up 
    add_column :caso, :created_at, :datetime
    add_column :caso, :updated_at, :datetime
    execute <<-SQL
      UPDATE caso SET created_at = current_date WHERE created_at IS NULL;
SQL
  end

  def down
    remove_column :caso, :created_at
    remove_column :caso, :updated_at
  end

end
