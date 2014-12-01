class Propnuevasbasicas < ActiveRecord::Migration
  def up
    execute <<-EOF
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'AGRICULATOR/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'MINERO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (102, 'COCINERO/A', '2014-07-28', NULL, '2014-07-28 15:17:02.95474', '2014-07-28 15:17:39.312986');
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'LIDER COMUNITARIO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'PANADERO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'TRABAJADOR INFORMAL', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'TRABAJADOR/GESTOR COMUNITARIO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'PESCADOR', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'TRABAJADOR DOMÉSTICO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'PIANGUERO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'OTRO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'CORTE Y COSTURA', '2014-03-10', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ALBAÑIL', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'PELUQUERÍA Y MANICURISTA', '2014-03-10', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'AMA DE CASA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'CAMPESINO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'COMERCIANTE', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'DESEMPLEADO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'ELECTRICISTA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'INDEPENDIENTE', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_actividadoficio (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'OFICIOS VARIOS', '2013-05-16', NULL, NULL, NULL);


INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'PREESCOLAR', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'PRIMARIA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'SECUNDARIA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'TÉCNICO', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_escolaridad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'PROFESIONAL', '2013-05-16', NULL, NULL, NULL);



INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'SIN INFORMACIÓN', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'CASADO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'DIVORCIADO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'SOLTERO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'UNIÓN LIBRE', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'VIUDO/A', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_estadocivil (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'SEPARADO/A', '2013-06-16', NULL, NULL, NULL);

INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (0, 'NO APLICA', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'GESTANTE', '2013-05-16', NULL, NULL, NULL);
INSERT INTO sivel2_gen_maternidad (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'LACTANTE', '2013-05-16', NULL, NULL, NULL);
    EOF
  end
end
