class AgregaIdACasoEtiqueta < ActiveRecord::Migration
  def up
   execute <<-SQL
     CREATE SEQUENCE caso_etiqueta_seq;
   SQL
   # La siguiente tuvo que hacerse a mano en base de datos.
   execute <<-SQL
    ALTER TABLE caso_etiqueta DROP CONSTRAINT 
      IF EXISTS caso_etiqueta_pkey CASCADE;
   SQL
   execute <<-SQL
    ALTER TABLE caso_etiqueta DROP CONSTRAINT 
      IF EXISTS etiquetacaso_pkey CASCADE;
   SQL
   execute <<-SQL
    ALTER TABLE caso_etiqueta ADD COLUMN 
      id INTEGER NOT NULL UNIQUE DEFAULT(nextval('caso_etiqueta_seq'));
   SQL
   execute <<-SQL
    ALTER TABLE caso_etiqueta ADD CONSTRAINT 
      caso_etiqueta_pkey PRIMARY KEY (id);
   SQL
  end
  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
