class UnificaFotraEnCasoFotra < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra ADD COLUMN
        nombre VARCHAR(500) COLLATE es_co_utf_8;
    SQL
    execute <<-SQL
      UPDATE sivel2_gen_caso_fotra 
        SET nombre=sivel2_gen_fotra.nombre  FROM
        sivel2_gen_fotra WHERE
        sivel2_gen_caso_fotra.id_fotra=sivel2_gen_fotra.id;
    SQL
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra  ALTER COLUMN nombre
        SET NOT NULL;
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra DROP COLUMN nombre;
    SQL
  end
end
