# frozen_string_literal: true

class Maspresponsables202411 < ActiveRecord::Migration[7.2]
  def up
    execute(<<-SQL)
      -- Mezcla propuestas de Yebrail y FASOL
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (43, 'Ministerio Público y Organos de Control', 1,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (44, 'Defensoría Nacional del Pueblo y Defensorías regionales', 43,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (45, 'Autoridades ambientales (Corporaciones Autónomas Regionales-CAR)',
        43, '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (46, 'Procuraduría General de la Nación', 43,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (47, 'Personería', 43,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (48, 'Contraloría General de la Nación', 43,
        '2024-11-19', '2024-11-19');



      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (49, 'Rama judicial (Corte Suprema de Justicia, Tribunales, Juzgados del circuito, juzgados municipales, juzgados promiscuos, jueces especiales)', 1,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (50, 'Rama Ejecutiva', 1,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (51, 'Presidencia de la República', 50,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (52, 'Ministerios (Justicia, Defensa, Interior, Medio Ambiente)', 50,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (53, 'Asambleas Departamentales', 50,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (54, 'Gobernaciones', 50,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (55, 'Alcaldías', 50,#{" "}
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (56, 'Concejos municipales', 50,
        '2024-11-19', '2024-11-19');

      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (57, 'Terceros Involucrados', 42,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (58, 'Empresarios nacionales', 57,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (59, 'Empresarios extranjeros', 57,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (60, 'Clanes políticos regionales y nacionales', 57,
        '2024-11-19', '2024-11-19');
      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (61, 'Medios Masivos de Información (nacionales y regionales: prensa, radio, tv)', 57,
        '2024-11-19', '2024-11-19');

      INSERT INTO sivel2_gen_presponsable (id, nombre, papa_id,#{" "}
        created_at, updated_at) VALUES#{" "}
        (62, 'Estados extranjeros', 42,
        '2024-11-19', '2024-11-19');
    SQL
  end

  def down
    execute(<<-SQL)
      DELETE FROM sivel2_gen_presponsable WHERE id>=43 AND id<=62;
    SQL
  end
end
