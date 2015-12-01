class IdFuenteprensa < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE SEQUENCE sivel2_gen_caso_fuenteprensa_seq;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa 
        DROP CONSTRAINT IF EXISTS sivel2_gen_caso_fuenteprensa_pkey CASCADE;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa 
        ADD UNIQUE(id_caso, fecha, fuenteprensa_id);
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa ADD COLUMN
        id INTEGER NOT NULL DEFAULT(nextval('sivel2_gen_caso_fuenteprensa_seq'));
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa ADD CONSTRAINT 
        sivel2_gen_caso_fuenteprensa_pkey PRIMARY KEY (id);
    SQL

    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa ADD COLUMN
        anexo_caso_id INTEGER REFERENCES sivel2_gen_anexo_caso(id);
    SQL
    execute <<-SQL
      UPDATE sivel2_gen_caso_fuenteprensa
        SET anexo_caso_id=sivel2_gen_anexo_caso.id
          FROM sivel2_gen_anexo_caso
        WHERE sivel2_gen_caso_fuenteprensa.id_caso=sivel2_gen_anexo_caso.id_caso
        AND sivel2_gen_caso_fuenteprensa.fecha=sivel2_gen_anexo_caso.fechaffrecuente
        AND sivel2_gen_caso_fuenteprensa.fuenteprensa_id=
          sivel2_gen_anexo_caso.fuenteprensa_id;
    SQL

#    execute <<-SQL
#      ALTER TABLE sivel2_gen_anexo_caso
#        ADD COLUMN caso_fuenteprensa_id INTEGER 
#          REFERENCES sivel2_gen_caso_fuenteprensa(id);
#    SQL
#    execute <<-SQL
#      UPDATE sivel2_gen_anexo_caso
#        SET caso_fuenteprensa_id=sivel2_gen_caso_fuenteprensa.id
#          FROM sivel2_gen_caso_fuenteprensa
#        WHERE sivel2_gen_caso_fuenteprensa.id_caso=sivel2_gen_anexo_caso.id_caso
#        AND sivel2_gen_caso_fuenteprensa.fecha=sivel2_gen_anexo_caso.fecha
#        AND sivel2_gen_caso_fuenteprensa.fuenteprensa_id=
#          sivel2_gen_anexo_caso.fuenteprensa_id;
#    SQL
  end

  def down
    execute <<-SQL
      UPDATE sivel2_gen_anexo_caso
        SET fechaffrecuente=sivel2_gen_caso_euenteprensa.fecha,
          fuenteprensa_id = sivel2_gen_caso_fuenteprensa.fuenteprensa_id
        FROM sivel2_gen_caso_fuenteprensa
        WHERE sivel2_gen_anexo_caso.id = sivel2_gen_caso_fuenteprensa.anexo_caso_id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        DROP COLUMN anexo_caso_id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa 
        DROP CONSTRAINT IF EXISTS sivel2_gen_caso_fuenteprensa_pkey CASCADE;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa DROP COLUMN id;
    SQL
    execute <<-SQL
      DROP SEQUENCE sivel2_gen_caso_fuenteprensa_seq;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa ADD CONSTRAINT 
        sivel2_gen_caso_fuenteprensa_pkey 
        PRIMARY KEY (id_caso, fecha, fuenteprensa_id);
   SQL
   execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa DROP CONSTRAINT 
        sivel2_gen_caso_fuenteprensa_id_caso_fecha_fuenteprensa_id_key;
   SQL
  end
end
