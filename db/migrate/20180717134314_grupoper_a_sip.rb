class GrupoperASip < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER INDEX IF EXISTS grupoper_pkey
        RENAME TO sivel2_gen_grupoper_pkey
    SQL
    rename_table :sivel2_gen_grupoper, :sip_grupoper
    execute <<-SQL
      ALTER SEQUENCE IF EXISTS sivel2_gen_grupoper_id_seq 
        RENAME TO sip_grupoper_id_seq
        
    SQL
  end
  def down
    execute <<-SQL
      ALTER SEQUENCE IF EXISTS sip_grupoper_id_seq
        RENAME TO sivel2_gen_grupoper_id_seq 
    SQL
    rename_table :sip_grupoper, :sivel2_gen_grupoper
  end
end
