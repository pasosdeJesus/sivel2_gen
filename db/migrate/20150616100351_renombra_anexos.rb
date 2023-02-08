class RenombraAnexos < ActiveRecord::Migration[4.2]
  def change
    execute <<-SQL
      ALTER SEQUENCE IF EXISTS anexo_seq RENAME TO sivel2_gen_anexo_id_seq;
      ALTER INDEX IF EXISTS anexo_pkey rename TO sivel2_gen_anexo_pkey;
    SQL
    rename_table :sivel2_gen_anexo, :sivel2_gen_anexo_caso
  end
end
