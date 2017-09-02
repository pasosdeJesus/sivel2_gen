class EtniaSinDuplicado < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
    UPDATE victima SET id_etnia='21' WHERE id_etnia='67';
    UPDATE etnia SET descripcion='14 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls' WHERE id='21';
    DELETE FROM etnia WHERE id='67';
    SQL
  end
  def down
    raise ActiveRecord::IrreversibleMigration 
  end
end
