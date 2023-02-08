class DatosResagresion < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      INSERT INTO sivel2_gen_resagresion(id, nombre, fechacreacion, created_at, updated_at) VALUES (1, 'MUERTO', '2001-01-01', '2016-07-19', '2016-07-19');
      INSERT INTO sivel2_gen_resagresion(id, nombre, fechacreacion, created_at, updated_at) VALUES (2, 'HERIDO', '2001-01-01', '2016-07-19', '2016-07-19');
      INSERT INTO sivel2_gen_resagresion(id, nombre, fechacreacion, created_at, updated_at) VALUES (3, 'PRIVADO DE LA LIBERTAD', '2001-01-01', '2016-07-19', '2016-07-19');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_resagresion WHERE id>='1' and id<='3';
    SQL
  end
end
