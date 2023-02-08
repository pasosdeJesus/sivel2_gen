class CreaReporteCaso < ActiveRecord::Migration[6.1]
  NOMBREMENU='Reporte genérico del caso'
  def up
    if Heb412Gen::Plantillahcr.where(id: 30).count == 0
      execute <<-SQL
        INSERT INTO heb412_gen_plantillahcr (id, ruta, fuente, 
          licencia, vista, nombremenu)
          VALUES (30, 'plantillas/reporte_un_caso.ods', 'Pasos de Jesús',
          'Dominio público', 'Caso', '#{NOMBREMENU}');

        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (300, 30, 'caso_id', 'B', 3);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (301, 30, 'fecha', 'G', 3);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (302, 30, 'titulo', 'B', 4);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (303, 30, 'duracion', 'G', 4);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (304, 30, 'hora', 'B', 5);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (305, 30, 'id_intervalo', 'G', 5);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (306, 30, 'ubicaciones', 'B', 6);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (307, 30, 'victimas', 'G', 6);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (308, 30, 'presponsables', 'B', 7);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (309, 30, 'tipificacion', 'G', 7);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (310, 30, 'memo', 'B', 9);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (311, 30, 'bienes', 'B', 11);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (312, 30, 'grconfiabilidad', 'B', 13);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (313, 30, 'gresclarecimiento', 'G', 13);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (314, 30, 'grimpunidad', 'B', 14);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (315, 30, 'grinformacion', 'G', 14);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (316, 30, 'created_at', 'B', 16);
        INSERT INTO heb412_gen_campoplantillahcr 
          (id, plantillahcr_id, nombrecampo, columna, fila)
          VALUES (317, 30, 'updated_at', 'G', 16);
      SQL
    end
  end
  def down
    if Heb412Gen::Plantillahcr.where(id: 30).count == 1 &&
        Heb412Gen::Plantillahcr.find(30).nombremenu == NOMBREMENU
      execute <<-SQL
        DELETE FROM heb412_gen_campoplantillahcr WHERE
          id>=300 AND id<=317;
        DELETE FROM heb412_gen_plantillahcr WHERE id=30;
      SQL
    end
  end
end
