# frozen_string_literal: true

class LlaveCasoCategoriaPresponsable < ActiveRecord::Migration[7.0]
  def up
    unless Msip::SqlHelper.existe_restricción_pg?(
      "sivel2_gen_caso_categoria_presponsable_pkey",
    )
      execute(<<~SQL.squish)
        CREATE TABLE tmp_ccp (
          id INTEGER PRIMARY KEY,
          id_categoria INTEGER NOT NULL,
          id_caso_presponsable INTEGER,
          updated_at TIMESTAMP WITHOUT TIME ZONE,
          created_at TIMESTAMP WITHOUT TIME ZONE
        );
        INSERT INTO tmp_ccp
          (id, id_categoria, id_caso_presponsable, updated_at, created_at)
          (SELECT DISTINCT id, id_categoria, id_caso_presponsable,
            updated_at, created_at FROM sivel2_gen_caso_categoria_presponsable)
        ;
        DELETE FROM sivel2_gen_caso_categoria_presponsable;
        ALTER TABLE sivel2_gen_caso_categoria_presponsable
          ADD PRIMARY KEY (id);
        INSERT INTO sivel2_gen_caso_categoria_presponsable
          (id, id_categoria, id_caso_presponsable, updated_at, created_at)
          (SELECT DISTINCT id, id_categoria, id_caso_presponsable,
            updated_at, created_at FROM tmp_ccp)
        ;
        DROP TABLE tmp_ccp;
      SQL
    end
  end

  def down
  end
end
