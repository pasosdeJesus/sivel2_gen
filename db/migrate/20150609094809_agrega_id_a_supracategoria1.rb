class AgregaIdASupracategoria1 < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria
      DROP CONSTRAINT IF EXISTS supracategoria_pkey CASCADE;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria RENAME COLUMN id TO codigo;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria ALTER COLUMN codigo DROP DEFAULT;
      ALTER TABLE sivel2_gen_supracategoria ALTER COLUMN codigo DROP NOT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria ADD COLUMN id INTEGER;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria ADD CONSTRAINT sivel2_gen_supracategoria_id_tviolencia_codigo_key UNIQUE(id_tviolencia, codigo);
    SQL
    execute <<-SQL
      UPDATE sivel2_gen_supracategoria SET id='1' WHERE codigo='1' AND id_tviolencia='A';
      UPDATE sivel2_gen_supracategoria SET id='2' WHERE codigo='1' AND id_tviolencia='B';
      UPDATE sivel2_gen_supracategoria SET id='3' WHERE codigo='1' AND id_tviolencia='C';
      UPDATE sivel2_gen_supracategoria SET id='4' WHERE codigo='1' AND id_tviolencia='D';
      UPDATE sivel2_gen_supracategoria SET id='5' WHERE codigo='2' AND id_tviolencia='A';
      UPDATE sivel2_gen_supracategoria SET id='6' WHERE codigo='2' AND id_tviolencia='B';
      UPDATE sivel2_gen_supracategoria SET id='7' WHERE codigo='2' AND id_tviolencia='D';
      UPDATE sivel2_gen_supracategoria SET id='8' WHERE codigo='3' AND id_tviolencia='A';
      UPDATE sivel2_gen_supracategoria SET id='9' WHERE codigo='3' AND id_tviolencia='D';
    SQL
    puts "Si quedan supracategorias por numerar hágalo manualente:"
    execute <<-SQL
      SELECT * from sivel2_gen_supracategoria WHERE id IS NULL;
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria DROP CONSTRAINT sivel2_gen_supracategoria_id_tviolencia_codigo_key
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria DROP COLUMN id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria ALTER COLUMN codigo SET NOT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria RENAME COLUMN codigo TO id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_supracategoria
      ADD CONSTRAINT supracategoria_pkey PRIMARY KEY (id, id_tviolencia)
    SQL

  end
end
