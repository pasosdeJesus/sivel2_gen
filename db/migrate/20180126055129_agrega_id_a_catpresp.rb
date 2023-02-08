class AgregaIdACatpresp < ActiveRecord::Migration[5.0]
  def up
   execute <<-SQL
     CREATE SEQUENCE sivel2_gen_caso_categoria_presponsable_id_seq;
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_caso_categoria_presponsable
      ADD UNIQUE(id_caso_presponsable, id_categoria);
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_caso_categoria_presponsable
      ADD COLUMN id INTEGER NOT NULL 
        UNIQUE DEFAULT(nextval('sivel2_gen_caso_categoria_presponsable_id_seq'));
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_caso_categoria_presponsable
      ADD CONSTRAINT sivel2_gen_caso_categoria_presponsable_pkey PRIMARY KEY (id);
   SQL
  end
  def down
   execute <<-SQL
    ALTER TABLE sivel2_gen_caso_categoria_presponsable
      DROP CONSTRAINT sivel2_gen_caso_categoria_presponsable_pkey;
   SQL
   execute <<-SQL
    ALTER TABLE sivel2_gen_caso_categoria_presponsable
      DROP COLUMN id
   SQL
    execute <<-SQL
    ALTER TABLE sivel2_gen_caso_categoria_presponsable
      DROP CONSTRAINT sivel2_gen_caso_categoria_pre_id_caso_presponsable_id_categ_key;
   SQL
 
   execute <<-SQL
     DROP SEQUENCE sivel2_gen_caso_categoria_presponsable_id_seq;
   SQL
  end
end
