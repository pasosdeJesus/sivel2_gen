class IdCasoOtrafuente < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE SEQUENCE sivel2_gen_caso_fotra_seq;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra
        DROP CONSTRAINT IF EXISTS sivel2_gen_caso_fotra_pkey CASCADE;
      ALTER TABLE sivel2_gen_caso_fotra
        DROP CONSTRAINT IF EXISTS caso_fotra_pkey CASCADE;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra
        ADD UNIQUE(id_caso, nombre, fecha);
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra ADD COLUMN
        id INTEGER NOT NULL DEFAULT(nextval('sivel2_gen_caso_fotra_seq'));
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra ADD CONSTRAINT 
        sivel2_gen_caso_fotra_pkey PRIMARY KEY (id);
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra 
        ALTER COLUMN id_fotra DROP NOT NULL;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra ADD COLUMN
        anexo_caso_id INTEGER REFERENCES sivel2_gen_anexo_caso(id);
    SQL
    execute <<-SQL
      UPDATE sivel2_gen_caso_fotra
        SET anexo_caso_id=sivel2_gen_anexo_caso.id
          FROM sivel2_gen_anexo_caso
        WHERE sivel2_gen_caso_fotra.id_caso=sivel2_gen_anexo_caso.id_caso
        AND sivel2_gen_caso_fotra.id_fotra=sivel2_gen_anexo_caso.id_fotra;
    SQL
  end

  def down
    execute <<-SQL
      UPDATE sivel2_gen_anexo_caso
        SET id_fotra = sivel2_gen_caso_fotra.id_fotra
        FROM sivel2_gen_caso_fotra
        WHERE sivel2_gen_anexo_caso.id = sivel2_gen_caso_fotra.anexo_caso_id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra
        DROP COLUMN anexo_caso_id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra 
        DROP CONSTRAINT IF EXISTS sivel2_gen_caso_fotra_pkey CASCADE;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra DROP COLUMN id;
    SQL
    execute <<-SQL
      DROP SEQUENCE sivel2_gen_caso_fotra_seq;
    SQL
#    execute <<-SQL
#      ALTER TABLE sivel2_gen_caso_fotra ADD CONSTRAINT 
#        sivel2_gen_caso_fotra_pkey 
#        PRIMARY KEY (id_caso, fecha, fotra_id);
#   SQL
   execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra DROP CONSTRAINT 
        sivel2_gen_caso_fotra_id_caso_nombre_fecha_key;
   SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra 
        ALTER COLUMN id_fotra SET NOT NULL;
    SQL
  end
end
