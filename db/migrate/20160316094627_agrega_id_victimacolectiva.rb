class AgregaIdVictimacolectiva < ActiveRecord::Migration

  def up
   execute <<-SQL
     CREATE SEQUENCE sivel2_gen_victimacolectiva_id_seq;
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_victimacolectiva 
      DROP CONSTRAINT IF EXISTS victimacolectiva_pkey CASCADE;
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_victimacolectiva ADD UNIQUE(id_caso, id_grupoper);
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_victimacolectiva ADD COLUMN id INTEGER 
      NOT NULL UNIQUE DEFAULT(nextval('sivel2_gen_victimacolectiva_id_seq'));
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_victimacolectiva ADD CONSTRAINT 
      sivel2_gen_victimacolectiva_pkey PRIMARY KEY (id);
   SQL
  end
  def down
    execute <<-SQL
    ALTER TABLE sivel2_gen_victimacolectiva DROP CONSTRAINT 
      IF EXISTS sivel2_gen_victimacolectiva_pkey;

    ALTER TABLE sivel2_gen_victimacolectiva DROP COLUMN id;

    ALTER TABLE sivel2_gen_victimacolectiva ADD CONSTRAINT 
      victimacolectiva_pkey PRIMARY KEY (id_caso, id_grupoper);

     DROP SEQUENCE sivel2_gen_victimacolectiva_id_seq;
    SQL
  end
end
