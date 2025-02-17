# frozen_string_literal: true

class RefAnexo < ActiveRecord::Migration[7.1]
  def up
    execute(<<-SQL)
      DELETE FROM sivel2_gen_anexo_caso WHERE
        anexo_id NOT IN (SELECT id FROM msip_anexo);
    SQL
    add_foreign_key(:sivel2_gen_anexo_caso, :msip_anexo, column: :anexo_id)
  end

  def down
    remove_foreign_key(:sivel2_gen_anexo_caso, :msip_anexo, column: :anexo_id)
  end
end
