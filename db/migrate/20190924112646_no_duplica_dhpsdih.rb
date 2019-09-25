class NoDuplicaDhpsdih < ActiveRecord::Migration[6.0]
  def change
    # Ya no replica DH por Violencia Pólitica en DIH.
    # Pues ya no puede suponerse que es por causa del conflicto armado
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET contadaen=NULL WHERE
      id IN (10, 12, 13, 15, 18, 19, 102, 104, 191, 192, 193, 194, 195, 196, 197);
    SQL
  end
end
