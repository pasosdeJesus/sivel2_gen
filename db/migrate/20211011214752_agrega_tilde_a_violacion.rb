class AgregaTildeAViolacion < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET nombre='VIOLACIÓN'WHERE id=391;
      UPDATE sivel2_gen_categoria SET nombre='VIOLACIÓN'WHERE id=291;
      UPDATE sivel2_gen_categoria SET nombre='VIOLACIÓN'WHERE id=191;
    SQL
  end

  def down
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET nombre='VIOLACION'WHERE id=391;
      UPDATE sivel2_gen_categoria SET nombre='VIOLACION'WHERE id=291;
      UPDATE sivel2_gen_categoria SET nombre='VIOLACION'WHERE id=191;
    SQL
  end
end
