class AgregaIdACasoPresponsable < ActiveRecord::Migration
  def change

    execute "CREATE SEQUENCE caso_presponsable_seq;"
    execute "ALTER TABLE caso_presponsable ALTER COLUMN id 
        SET DEFAULT(nextval('caso_presponsable_seq'));"
    execute "ALTER TABLE ONLY caso_categoria_presponsable DROP CONSTRAINT 
        IF EXISTS caso_categoria_presponsable_id_fkey "
    execute "ALTER TABLE ONLY caso_categoria_presponsable DROP CONSTRAINT 
        IF EXISTS categoria_p_responsable_caso_id_fkey"

    execute "UPDATE caso_presponsable SET
        id = id_caso*1000 + id_presponsable*10 + id WHERE id<10;"
    execute "ALTER TABLE caso_presponsable ADD UNIQUE(id);"
    execute "SELECT setval('caso_presponsable_seq', MAX(id)) 
        FROM (SELECT 10 as id UNION SELECT MAX(id) 
        FROM caso_presponsable) AS s;"
    execute "ALTER TABLE caso_presponsable ALTER COLUMN tipo
        SET DEFAULT 0;"
    execute "ALTER TABLE caso_categoria_presponsable 
        ADD COLUMN id_caso_presponsable INTEGER 
          REFERENCES caso_presponsable(id);"
    execute "UPDATE caso_categoria_presponsable SET
        id_caso_presponsable = id_caso*1000 + id_presponsable*10 + id WHERE id<10;"
    execute "ALTER TABLE caso_categoria_presponsable DROP COLUMN id;"
    execute "ALTER TABLE caso_presponsable 
        DROP CONSTRAINT IF EXISTS caso_presponsable_pkey;"
    execute "ALTER TABLE caso_presponsable 
        DROP CONSTRAINT IF EXISTS presuntos_responsables_caso_pkey;"
    execute "ALTER TABLE caso_presponsable ADD PRIMARY KEY (id);"

  end
end
