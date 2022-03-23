class AjustaD715 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET
        nombre='JUDICIALIZACIÓN ARBITRARIA COMO INSTRUMENTO DE GUERRA'
        WHERE id=715;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET
        nombre='JUDICIALIZACIÓN ARBITRARIA'
        WHERE id=715;
    SQL
  end
end
