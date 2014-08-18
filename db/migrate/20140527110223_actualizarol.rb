class Actualizarol < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE usuario DROP CONSTRAINT usuario_rol_check;
      ALTER TABLE usuario ADD CONSTRAINT usuario_rol_check CHECK (rol>=1 and rol<=6);
SQL
      end
end
