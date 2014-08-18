class AgregaIdVictima < ActiveRecord::Migration
  def up
   execute <<-SQL
     CREATE SEQUENCE victima_seq;
   SQL
   # La siguiente tuvo que hacerse a mano en base de datos.
   execute <<-SQL
    ALTER TABLE victima DROP CONSTRAINT IF EXISTS victima_pkey CASCADE;
   SQL
   execute <<-SQL
    ALTER TABLE victima ADD UNIQUE(id_caso, id_persona);
   SQL
   execute <<-SQL
    ALTER TABLE victima ADD COLUMN id INTEGER NOT NULL UNIQUE DEFAULT(nextval('victima_seq'));
   SQL
   execute <<-SQL
    ALTER TABLE victima ADD CONSTRAINT victima_pkey PRIMARY KEY (id);
   SQL
   execute <<-SQL
    ALTER TABLE antecedente_victima ADD CONSTRAINT victima_fkey
        FOREIGN KEY (id_caso, id_persona) 
        REFERENCES victima(id_caso, id_persona);
   SQL
   execute <<-SQL
    ALTER TABLE antecedente_victima ADD COLUMN id_victima 
        INTEGER REFERENCES victima(id);
   SQL
   execute <<-SQL
    UPDATE antecedente_victima SET id_victima=victima.id 
      FROM victima WHERE antecedente_victima.id_persona=victima.id_persona 
      AND antecedente_victima.id_caso=victima.id_caso;
   SQL
  end
  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
