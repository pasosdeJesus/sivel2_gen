class AgregaIdAActocolectivo < ActiveRecord::Migration[5.0]
  def up
   execute <<-SQL
     CREATE SEQUENCE sivel2_gen_actocolectivo_id_seq;
   SQL
   # La siguiente tuvo que hacerse a mano en base de datos.
   execute <<-SQL
    ALTER TABLE sivel2_gen_actocolectivo 
      DROP CONSTRAINT IF EXISTS actocolectivo_pkey CASCADE;
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_actocolectivo 
      ADD UNIQUE(id_presponsable, id_categoria, id_grupoper, id_caso);
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_actocolectivo 
      ADD COLUMN id INTEGER NOT NULL 
        UNIQUE DEFAULT(nextval('sivel2_gen_actocolectivo_id_seq'));
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_actocolectivo 
      ADD CONSTRAINT sivel2_gen_actocolectivo_pkey PRIMARY KEY (id);
   SQL
  end
  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
