class AgregaIdASupracategoria2 < ActiveRecord::Migration
  def up
   execute <<-SQL
     CREATE SEQUENCE sivel2_gen_supracategoria_id_seq;
   SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria ALTER COLUMN id
        SET DEFAULT(nextval('sivel2_gen_supracategoria_id_seq'));
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria ADD CONSTRAINT 
        sivel2_gen_supracategoria_pkey PRIMARY KEY (id);
    SQL
    execute <<-SQL
      SELECT setval('sivel2_gen_supracategoria_id_seq', MAX(id)) FROM  
        (SELECT 100 as id UNION  
          SELECT MAX(id) FROM sivel2_gen_supracategoria) AS s;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_categoria RENAME COLUMN 
        id_supracategoria TO codigo_supracategoria
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_categoria ADD COLUMN supracategoria_id
        INTEGER REFERENCES sivel2_gen_supracategoria(id);
    SQL
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET supracategoria_id=sivel2_gen_supracategoria.id 
        FROM sivel2_gen_supracategoria 
        WHERE sivel2_gen_categoria.codigo_supracategoria=sivel2_gen_supracategoria.codigo 
        AND sivel2_gen_categoria.id_tviolencia = sivel2_gen_supracategoria.id_tviolencia;
    SQL
    execute <<-SQL
      DROP MATERIALIZED VIEW IF EXISTS sivel2_gen_conscaso;
    SQL
    execute <<-SQL
      DROP VIEW IF EXISTS sivel2_gen_conscaso1;
    SQL
    execute <<-SQL
      DROP VIEW IF EXISTS cons;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_categoria DROP COLUMN id_tviolencia;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_categoria DROP COLUMN codigo_supracategoria;
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_categoria ADD COLUMN codigo_supracategoria INTEGER
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_categoria ADD COLUMN id_tviolencia CHARACTER(1)
        REFERENCES sivel2_gen_tviolencia(id);
    SQL
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET codigo_supracategoria=sivel2_gen_supracategoria.codigo, id_tviolencia=sivel2_gen_supracategoria.id_tviolencia
        FROM sivel2_gen_supracategoria 
        WHERE sivel2_gen_categoria.supracategoria_id=sivel2_gen_supracategoria.id;
    SQL
    execute <<-SQL 
      ALTER TABLE sivel2_gen_categoria DROP COLUMN supracategoria_id
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_categoria RENAME COLUMN 
        codigo_supracategoria TO id_supracategoria
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria DROP CONSTRAINT 
        sivel2_gen_supracategoria_pkey
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria ALTER COLUMN id DROP DEFAULT
    SQL
   execute <<-SQL
     DROP SEQUENCE sivel2_gen_supracategoria_id_seq;
   SQL
  end
end
