class RefAnexo < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :sivel2_gen_anexo_caso, :msip_anexo, column: :anexo_id
  end
end
