class RenombraFuenteprensa < ActiveRecord::Migration
  def up
    #execute <<-SQL
    #  DROP SEQUENCE sip_fuenteprensa_id_seq;
    #SQL
    execute <<-SQL
      DROP TABLE sip_fuenteprensa;
    SQL
    execute <<-SQL
      ALTER SEQUENCE ffrecuente_seq RENAME TO sip_fuenteprensa_id_seq; 
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_ffrecuente RENAME TO sip_fuenteprensa; 
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_anexo 
        RENAME COLUMN id_ffrecuente TO fuenteprensa_id
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_ffrecuente 
        RENAME TO sivel2_gen_caso_fuenteprensa
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        RENAME COLUMN id_ffrecuente TO fuenteprensa_id
    SQL
    execute <<-SQL
      ALTER INDEX caso_ffrecuente_pkey 
        RENAME TO sivel2_gen_caso_fuenteprensa_pkey
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        RENAME CONSTRAINT caso_ffrecuente_id_caso_fkey 
        TO sivel2_gen_caso_fuenteprensa_id_caso_fkey;
    SQL
     execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        RENAME CONSTRAINT caso_ffrecuente_id_ffrecuente_fkey 
        TO sivel2_gen_caso_fuenteprensa_fuenteprensa_id_fkey;
    SQL
    execute <<-SQL
      ALTER INDEX ffrecuente_pkey
        RENAME TO  sip_fuenteprensa_pkey
    SQL
    execute <<-SQL
      ALTER TABLE sip_fuenteprensa
        RENAME CONSTRAINT ffrecuente_check
        TO sip_fuenteprensa_check
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_anexo
        RENAME CONSTRAINT anexo_id_ffrecuente_fkey
        TO anexo_fuenteprensa_id_fkey
    SQL
    execute <<-SQL
      ALTER TABLE sip_fuenteprensa
        ALTER COLUMN tfuente DROP NOT NULL
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE sip_fuenteprensa
        ALTER COLUMN tfuente SET NOT NULL
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_anexo
        RENAME CONSTRAINT anexo_fuenteprensa_id_fkey
        TO anexo_id_ffrecuente_fkey
    SQL
    execute <<-SQL
      ALTER TABLE sip_fuenteprensa
        RENAME CONSTRAINT sip_fuenteprensa_check
        TO ffrecuente_check
    SQL
    execute <<-SQL
      ALTER INDEX sip_fuenteprensa_pkey
        RENAME TO ffrecuente_pkey
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        RENAME CONSTRAINT sivel2_gen_caso_fuenteprensa_fuenteprensa_id_fkey
        TO caso_ffrecuente_id_ffrecuente_fkey ;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        RENAME CONSTRAINT sivel2_gen_caso_fuenteprensa_id_caso_fkey
        TO caso_ffrecuente_id_caso_fkey;
    SQL
    execute <<-SQL
      ALTER INDEX sivel2_gen_caso_fuenteprensa_pkey
        RENAME TO  caso_ffrecuente_pkey;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        RENAME COLUMN fuenteprensa_id TO id_ffrecuente
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fuenteprensa
        RENAME TO sivel2_gen_caso_ffrecuente;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_anexo 
        RENAME COLUMN fuenteprensa_id TO id_ffrecuente;
    SQL
    execute <<-SQL
      ALTER TABLE sip_fuenteprensa RENAME TO sivel2_gen_ffrecuente;
    SQL
    execute <<-SQL
      ALTER SEQUENCE sip_fuenteprensa_id_seq RENAME TO ffrecuente_seq;
    SQL
    execute <<-SQL
      CREATE SEQUENCE sip_fuenteprensa_id_seq
          START WITH 1
          INCREMENT BY 1
          NO MINVALUE
          NO MAXVALUE
          CACHE 1;
      CREATE TABLE sip_fuenteprensa (
          id integer NOT NULL,
          nombre character varying(500),
          observaciones character varying(5000),
          fechacreacion date,
          fechadeshabilitacion date,
          created_at timestamp without time zone NOT NULL,
          updated_at timestamp without time zone,
          tfuente character varying(25)
      );
      ALTER SEQUENCE sip_fuenteprensa_id_seq OWNED BY sip_fuenteprensa.id;
      ALTER TABLE ONLY sip_fuenteprensa ALTER COLUMN id SET DEFAULT nextval('sip_fuenteprensa_id_seq'::regclass);
    SQL

  end
end
