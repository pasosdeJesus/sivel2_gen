class AjustaZenu < ActiveRecord::Migration[6.1]
  def up
    if Sivel2Gen::Etnia.where(id: 110).count == 1 &&
      Sivel2Gen::Etnia.where(id: 61).count == 1 &&
      Sivel2Gen::Etnia.find(110).nombre='ZENÚ' &&
      Sivel2Gen::Etnia.find(61).nombre='Zenú'
      execute <<-SQL
        UPDATE sivel2_gen_victima SET id_etnia=61 
          WHERE id_etnia=110;
        UPDATE sivel2_gen_etnia_victimacolectiva SET etnia_id=61 
          WHERE etnia_id=110;
        UPDATE sivel2_gen_etnia SET 
          descripcion='83 en http://www.mineducacion.gov.co/1621/articles-255690_archivo_xls_listado_etnias.xls',
          nombre='ZENÚ' WHERE id='61';
        DELETE FROM sivel2_gen_etnia WHERE id=110;
      SQL
    end
  end

  def down
  end
end
