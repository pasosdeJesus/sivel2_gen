class AgregaIdAActo < ActiveRecord::Migration[4.2]
  def up
   execute <<-SQL
     CREATE SEQUENCE acto_seq;
   SQL
   # La siguiente tuvo que hacerse a mano en base de datos.
   execute <<-SQL
    ALTER TABLE acto DROP CONSTRAINT IF EXISTS acto_pkey CASCADE;
   SQL
   execute <<-SQL
    ALTER TABLE acto ADD UNIQUE(id_presponsable, id_categoria, id_persona, id_caso);
   SQL
   execute <<-SQL
    ALTER TABLE acto ADD COLUMN id INTEGER NOT NULL UNIQUE DEFAULT(nextval('acto_seq'));
   SQL
   execute <<-SQL
    ALTER TABLE acto ADD CONSTRAINT acto_pkey PRIMARY KEY (id);
   SQL
  end
  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
