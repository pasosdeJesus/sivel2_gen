# frozen_string_literal: true

class ModificaPsei < ActiveRecord::Migration[7.2]
  def up
    execute(<<-SQL)
      UPDATE sivel2_gen_presponsable SET papa_id=NULL WHERE id=39; --P. Estatal
      UPDATE sivel2_gen_presponsable SET papa_id=39 WHERE id=42 ; --PSEI
      UPDATE sivel2_gen_presponsable SET papa_id=39 WHERE id=41 ; --Empresas
    SQL
  end

  def down
    execute(<<-SQL)
      UPDATE sivel2_gen_presponsable SET papa_id=42 WHERE id=41 ; --Empresas
      UPDATE sivel2_gen_presponsable SET papa_id=NULL WHERE id=42; --PSEI
      UPDATE sivel2_gen_presponsable SET papa_id=42 WHERE id=39 ; --P. Estatal
    SQL
  end
end
