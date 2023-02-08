class GenPolo < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION sivel2_gen_polo_id(presponsable_id INTEGER) 
        RETURNS INTEGER AS $$
        WITH RECURSIVE des AS (
          SELECT id, nombre, papa_id 
          FROM sivel2_gen_presponsable WHERE id=presponsable_id 
          UNION SELECT e.id, e.nombre, e.papa_id 
          FROM sivel2_gen_presponsable e INNER JOIN des d ON d.papa_id=e.id) 
        SELECT id FROM des WHERE papa_id IS NULL;
      $$ LANGUAGE SQL;
      
      CREATE OR REPLACE FUNCTION sivel2_gen_polo_nombre(presponsable_id INTEGER) 
        RETURNS VARCHAR AS $$
        SELECT CASE 
          WHEN fechadeshabilitacion IS NULL THEN nombre
          ELSE nombre || '(DESHABILITADO)' 
        END 
        FROM sivel2_gen_presponsable 
        WHERE id=sivel2_gen_polo_id(presponsable_id)
      $$ LANGUAGE SQL;
    SQL
  end

  def down
    execute <<-SQL
      DROP function sivel2_gen_polo_id;
      DROP function sivel2_gen_polo_nombre;
    SQL
  end
end
