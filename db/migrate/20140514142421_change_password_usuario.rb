class ChangePasswordUsuario < ActiveRecord::Migration[4.0]
  def change
    change_column_default(:usuario, :password, '')
    execute <<-SQL
      ALTER TABLE usuario ALTER COLUMN fechacreacion SET DEFAULT current_date;
SQL

  end
end
