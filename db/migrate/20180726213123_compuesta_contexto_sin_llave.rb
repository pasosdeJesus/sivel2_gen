class CompuestaContextoSinLlave < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_contexto DROP CONSTRAINT IF EXISTS 
        caso_contexto_pkey;
    SQL
  end
  def down
    execute <<-SQL
     ALTER TABLE sivel2_gen_caso_contexto ADD CONSTRAINT 
      caso_contexto_pkey PRIMARY KEY (id_caso, id_contexto);
    SQL
  end
end
