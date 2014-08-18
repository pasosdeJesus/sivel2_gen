class AddComosupoToCasosjr < ActiveRecord::Migration
  def change
    remove_column :casosjr, :comosupo, :string
    add_reference :casosjr, :comosupo, index: true, default: 1
    execute <<-SQL
        ALTER TABLE casosjr ADD FOREIGN KEY (comosupo_id)
            REFERENCES comosupo(id);
SQL
  end
end
