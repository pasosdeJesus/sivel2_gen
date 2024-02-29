class CambiaEtnia < ActiveRecord::Migration[7.1]
  def up
    # Completa etnias
    execute <<-SQL
      INSERT INTO msip_etnia (id, nombre, descripcion, observaciones,
      fechacreacion, fechadeshabilitacion, created_at, updated_at) 
      (SELECT id, nombre, descripcion, observaciones,
        fechacreacion, fechadeshabilitacion, created_at, updated_at
        FROM sivel2_gen_etnia WHERE
        id NOT IN (SELECT id FROM msip_etnia));
    SQL

    execute <<-SQL
      UPDATE msip_persona SET etnia_id=sivel2_gen_victima.etnia_id 
        FROM sivel2_gen_victima WHERE persona_id=msip_persona.id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_victima DROP COLUMN etnia_id CASCADE;
    SQL
    rename_column :sivel2_gen_etnia_victimacolectiva, :etnia_id, :msip_etnia_id
    add_column :sivel2_gen_etnia_victimacolectiva, :etnia_id, 
      :integer, null: false, default: 1
    add_foreign_key :sivel2_gen_etnia_victimacolectiva, :msip_etnia,
      column: :etnia_id
    execute <<-SQL
      UPDATE sivel2_gen_etnia_victimacolectiva 
        SET etnia_id=msip_etnia_id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_etnia_victimacolectiva DROP COLUMN etnia_id CASCADE;
    SQL
    execute <<-SQL
      ALTER TABLE ONLY public.sivel2_gen_etnia_victimacolectiva
        ADD CONSTRAINT sivel2_gen_etnia_victimacolectiva_pkey1 
        PRIMARY KEY (etnia_id, victimacolectiva_id);
    SQL
  end
  def down
  end
end
