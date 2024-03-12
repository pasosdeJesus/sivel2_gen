class MejoraCategorias202403 < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      UPDATE public.sivel2_gen_categoria 
        SET nombre='CONFINAMIENTO COLECTIVO' WHERE id IN (403,503);
    SQL
  end
  def down
    execute <<-SQL
      UPDATE public.sivel2_gen_categoria 
        SET  nombre='CONFINAMIENTO COMO REPRESALIA O CASTIGO COLECTIVO'
        WHERE id IN (403, 503);
    SQL
  end
end
