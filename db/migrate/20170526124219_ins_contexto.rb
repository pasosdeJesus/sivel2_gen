# encoding: utf-8

class InsContexto < ActiveRecord::Migration[5.0]
  def up
    if Sivel2Gen::Contexto.where(id: 1).count == 0
      execute <<-SQL
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (1, 'MILITARIZACIÓN', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (2, 'PARAMILITARIZACIÓN', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (3, 'PRESENCIA GUERRILLERA', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (4, 'PRESENCIA DE MILICIAS', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (5, 'ACCIONES BÉLICAS', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (6, 'PARO CÍVICO', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (7, 'MANIFESTACIONES', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (8, 'PROTESTA', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (9, 'OCUPACIONES', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (27, 'ZONAS DE REHAB. Y CONSOL', '2003-03-12', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (28, 'CONFLICTO ARMADO', '2004-02-18', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (10, 'PARO AGRARIO', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (11, 'MARCHA CAMPESINA', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (12, 'TOMA DE TIERRAS', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (13, 'ENCLAVES ECONÓMICOS', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (14, 'CULTIVOS DE USO ILÍCITO', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (15, 'CONFLICTOS LABORALES', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (16, 'CONFLICTOS ESTUDIANTILES', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (17, 'PROBL. ÉTNICA (NEG.E IN.)', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (18, 'PROBLEMÁTICA FRONTERIZA', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (19, 'PROBLEMÁTICA AMBIENTAL', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (20, 'PROBLEMÁTICA CARCELARIA', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (21, 'DESALOJOS', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (22, 'PROCESOS DE PAZ O DIÁLOGO', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (23, 'PROCESOS ELECTORALES', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (24, 'CAMPAÑAS DE INTOLERANCIA', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (25, 'PERSECUSIÓN A ORGANIZACION', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (26, 'OTROS', '2001-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (29, 'FALSO POSITIVO', '2010-01-29', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (30, 'INTOLERANCIA SOCIAL', '2011-04-26', NULL, NULL, NULL);
        INSERT INTO sivel2_gen_contexto (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at) VALUES (31, 'SEGURIDAD INFORMÁTICA', '2011-04-28', NULL, NULL, NULL);
      SQL
    end
  end

  def down
    execute <<-SQL
      DELETE FROM contexto WHERE id>=1 AND id<=31;
    SQL
  end
end
