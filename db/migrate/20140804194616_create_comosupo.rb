class CreateComosupo < ActiveRecord::Migration
  def change
    create_table :comosupo do |t|
      t.string :nombre, limit: 500, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps
    end

    execute <<-SQL
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'SIN INFORMACIÓN', NULL, '2014-08-04', NULL, '2014-08-04 19:53:39.287255', '2014-08-04 19:53:39.287255');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'ONG', NULL, '2014-08-04', NULL, '2014-08-04 19:53:54.781026', '2014-08-04 19:54:13.259093');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'PAGINA DE INTERNET DEL SJR U OTRAS REDES SOCIALES', NULL, '2014-08-04', NULL, '2014-08-04 19:55:21.719879', '2014-08-04 19:55:21.719879');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'OTRAS AGENCIAS HUMANITARIAS', NULL, '2014-08-04', NULL, '2014-08-04 19:55:41.977827', '2014-08-04 19:55:41.977827');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'IGLESIA – AGENTE PARROQUIAL', NULL, '2014-08-04', NULL, '2014-08-04 19:56:02.298318', '2014-08-04 19:56:02.298318');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'OTROS SOLICITANTES O DESPLAZADOS', NULL, '2014-08-04', NULL, '2014-08-04 19:56:34.93592', '2014-08-04 19:56:34.93592');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'COMUNIDAD DE ACOGIDA', NULL, '2014-08-04', NULL, '2014-08-04 19:56:52.496091', '2014-08-04 19:56:52.496091');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'CONSEJO COMUNAL', NULL, '2014-08-04', NULL, '2014-08-04 19:57:11.1354', '2014-08-04 19:57:11.1354');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'FAMILIARES O AMIGOS', NULL, '2014-08-04', NULL, '2014-08-04 19:57:33.115672', '2014-08-04 19:57:33.115672');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'REDES COMUNITARIAS O VECINALES', NULL, '2014-08-04', NULL, '2014-08-04 19:58:00.813473', '2014-08-04 19:58:00.813473');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'RADIO', NULL, '2014-08-04', NULL, '2014-08-04 19:58:18.1238', '2014-08-04 19:58:18.1238');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'INSTITUCIONES EDUCATIVAS', NULL, '2014-08-04', NULL, '2014-08-04 19:58:46.06298', '2014-08-04 19:58:46.06298');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'REMISIÓN DE LA CNR', NULL, '2014-08-04', NULL, '2014-08-04 19:59:03.341518', '2014-08-04 19:59:03.341518');
INSERT INTO comosupo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'CONTACTO DIRECTO.', NULL, '2014-08-04', NULL, '2014-08-04 19:59:23.737069', '2014-08-04 19:59:23.737069');
SQL
  end
end
