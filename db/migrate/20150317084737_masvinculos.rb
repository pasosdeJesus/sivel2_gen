class Masvinculos < ActiveRecord::Migration
  def up
    execute <<-SQL
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, created_at) VALUES (42, 'FUERZAS MILITARES', '2015-03-17', '2015-03-17');
INSERT INTO sivel2_gen_vinculoestado (id, nombre, fechacreacion, created_at) VALUES (43, 'POLICIA', '2015-03-17', '2015-03-17');
    SQL
  end
  def down
    execute <<-SQL
DELETE FROM sivel2_gen_vinculoestado WHERE id IN ('42', '43');
    SQL
  end
end
