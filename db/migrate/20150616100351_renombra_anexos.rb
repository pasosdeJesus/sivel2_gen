class RenombraAnexos < ActiveRecord::Migration[4.2]
  def change
    rename_table :sivel2_gen_anexo, :sivel2_gen_anexo_caso
  end
end
