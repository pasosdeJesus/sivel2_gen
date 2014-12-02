class Propnuevasbasicas < ActiveRecord::Migration
  def up
    execute <<-EOF
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 0);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 1, 'AGRICULATOR/A', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 1);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 10, 'MINERO', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 10);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 102, 'COCINERO/A', '2014-07-28', NULL, '2014-07-28 15:17:02.95474', '2014-07-28 15:17:39.312986' WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 102);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 11, 'LIDER COMUNITARIO', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 11);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 12, 'PANADERO/A', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 12);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 13, 'TRABAJADOR INFORMAL', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 13);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 14, 'TRABAJADOR/GESTOR COMUNITARIO', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 14);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 15, 'PESCADOR', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 15);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 16, 'TRABAJADOR DOMÉSTICO', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 16);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 17, 'PIANGUERO', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 17);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 18, 'OTRO', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 18);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 19, 'CORTE Y COSTURA', '2014-03-10', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 19);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 2, 'ALBAÑIL', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 2);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 20, 'PELUQUERÍA Y MANICURISTA', '2014-03-10', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 20);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 3, 'AMA DE CASA', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 3);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 4, 'CAMPESINO/A', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 4);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 5, 'COMERCIANTE', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 5);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 6, 'DESEMPLEADO/A', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 6);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 7, 'ELECTRICISTA', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 7);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 8, 'INDEPENDIENTE', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 8);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 9, 'OFICIOS VARIOS', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_actividadoficio WHERE id = 9);


INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_escolaridad WHERE id = 0);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 1, 'PREESCOLAR', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_escolaridad WHERE id = 1);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 2, 'PRIMARIA', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_escolaridad WHERE id = 2);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 3, 'SECUNDARIA', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_escolaridad WHERE id = 3);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 4, 'TÉCNICO', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_escolaridad WHERE id = 4);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 5, 'PROFESIONAL', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_escolaridad WHERE id = 5);



INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_estadocivil WHERE id = 0);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 1, 'CASADO/A', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_estadocivil WHERE id = 1);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 2, 'DIVORCIADO/A', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_estadocivil WHERE id = 2);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 3, 'SOLTERO/A', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_estadocivil WHERE id = 3);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 4, 'UNIÓN LIBRE', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_estadocivil WHERE id = 4);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 5, 'VIUDO/A', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_estadocivil WHERE id = 5);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 6, 'SEPARADO/A', '2013-06-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_estadocivil WHERE id = 6);

INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 0, 'NO APLICA', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_maternidad WHERE id = 0);
INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 1, 'GESTANTE', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_maternidad WHERE id = 1);
INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) SELECT 2, 'LACTANTE', '2013-05-16', NULL, NULL, NULL WHERE NOT EXISTS (SELECT id FROM sivel2_gen_maternidad WHERE id = 2);
    EOF
  end
end
