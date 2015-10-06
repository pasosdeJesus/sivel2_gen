class Masescolaridad < ActiveRecord::Migration
  def up
    execute <<-SQL
    INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (6, 'NINGUNO', '2015-10-06', NULL, NULL, NULL, NULL); --101
    INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (7, 'ANALFABETA', '2015-10-06', NULL, NULL, NULL, NULL); --102
     INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (8, 'PRIMARIA INCOMPLETA', '2015-10-06', NULL, NULL, NULL, NULL); --103
     INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (9, 'SECUNDARIA INCOMPLETA', '2015-10-06', NULL, NULL, NULL, NULL); --105
     INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (10, 'TÉCNICO INCOMPLETO', '2015-10-06', NULL, NULL, NULL, NULL); --106
     INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (11, 'PROFESIONAL INCOMPLETO', '2015-10-06', NULL, NULL, NULL, NULL); --104
     SQL
  end
  def down
    execute <<-SQL
    DELETE FROM sivel2_gen_escolaridad WHERE id>='6' AND id<='11';
    SQL
  end
end
