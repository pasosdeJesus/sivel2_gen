class EliminaTablasTmp < ActiveRecord::Migration[7.0]
  include Msip::SqlHelper

  TAB=[
    ["resagresion", "sivel2_gen_resagresion"],
    ["combatiente_presponsable", "sivel2_gen_combatiente_presponsable"],
    ["combatiente", "sivel2_gen_combatiente"],
  ]


  def up
    TAB.each do |nomini, nomfin| 
      if table_exists?(nomini) && !table_exists?(nomfin)
        rename_table nomini, nomfin
      elsif table_exists?(nomini) && table_exists?(nomfin)
        drop_table nomini, force: :cascade
      end
    end

    execute <<~SQL.squish
      DROP SEQUENCE IF EXISTS combatiente_seq;
      DROP SEQUENCE IF EXISTS homonimosim_seq;
      DROP SEQUENCE IF EXISTS resagresion_seq;
    SQL

    if existe_restricción_pg?('anexo_id_fuente_directa_fkey')
      renombrar_restricción_pg('sivel2_gen_anexo_caso',
                              'anexo_id_fuente_directa_fkey',
                              'sivel2_gen_anexo_caso_fotra_id_fkey',)
    end

    # En el momento no se usa sivel2_gen_fotra pero tiene información
    # histórica que al menos debe mantenerse de manera consistente hasta
    # que vuelva a usarse
    execute <<~SQL.squish
      SELECT pg_catalog.setval('sivel2_gen_fotra_id_seq', MAX(id)+1, true)
        FROM sivel2_gen_fotra;
      ALTER TABLE sivel2_gen_fotra 
        ALTER COLUMN id 
          SET default nextval('sivel2_gen_fotra_id_seq'::text::regclass);
    SQL
  end

  def down
  end
end
