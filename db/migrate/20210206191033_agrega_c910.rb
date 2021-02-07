class AgregaC910 < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET fechacreacion=NULL
        WHERE id=910;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET fechacreacion='2017-05-03'
        WHERE id=910;
    SQL
  end
end
