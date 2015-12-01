class UnificaFotraEnCasoFotra < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra ADD COLUMN
        nombre VARCHAR(500) COLLATE es_co_utf_8 NOT NULL;
    SQL
    execute <<-SQL
      UPDATE sivel2_gen_caso_fotra 
        SET nombre=sivel2_gen_fotra.nombre  FROM
        sivel2_gen_fotra WHERE
        sivel2_gen_caso_fotra.id_fotra=sivel2_gen_fotra.id;
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE sivel2_gen_caso_fotra DROP COLUMN nombre;
    SQL
  end
end
