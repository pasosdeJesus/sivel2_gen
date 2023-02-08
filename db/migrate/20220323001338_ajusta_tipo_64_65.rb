class AjustaTipo6465 < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET tipocat='O' WHERE id IN (64,65);
    SQL
  end

  def down
  end
end
