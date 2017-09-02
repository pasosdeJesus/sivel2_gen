class Actualizarol < ActiveRecord::Migration[4.2]
  def change
    execute <<-SQL
      ALTER TABLE usuario DROP CONSTRAINT IF EXISTS usuario_rol_check;
      ALTER TABLE usuario ADD CONSTRAINT usuario_rol_check CHECK (rol>=1 and rol<=6);
    SQL
  end
end
