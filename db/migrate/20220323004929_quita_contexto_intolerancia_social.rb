class QuitaContextoIntoleranciaSocial < ActiveRecord::Migration[6.1]
  def up
    if Sivel2Gen::Contexto.where(id: 24).count == 1 &&
      Sivel2Gen::Contexto.find(24).nombre == 'CAMPAÑAS DE INTOLERANCIA' &&
      Sivel2Gen::Contexto.where(id: 30).count == 1 &&
      Sivel2Gen::Contexto.find(30).nombre == 'INTOLERANCIA SOCIAL'
      execute <<-SQL
        DELETE FROM sivel2_gen_caso_contexto
          WHERE id_contexto=30 AND 
          id_caso IN (SELECT id_caso 
            FROM sivel2_gen_caso_contexto WHERE id_contexto=24);
        UPDATE sivel2_gen_caso_contexto 
          SET id_contexto=24
          WHERE id_contexto=30;
        DELETE FROM sivel2_gen_contexto WHERE id=30;
      SQL
    end
  end

  def down
  end
end
