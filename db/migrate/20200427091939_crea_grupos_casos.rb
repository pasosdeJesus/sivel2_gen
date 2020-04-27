class CreaGruposCasos < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO sip_grupo (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (20, 'Analista de Casos', 
        '2020-04-27','2020-04-27','2020-04-27');
      INSERT INTO sip_grupo (id, nombre, fechacreacion, created_at, updated_at)
        VALUES (21, 'Observador de Casos', 
        '2020-04-27','2020-04-27','2020-04-27');
      INSERT INTO sip_grupo_usuario (usuario_id, sip_grupo_id) 
        (SELECT id, 20 FROM usuario);
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sip_grupo_usuario WHERE sip_grupo_id=20;
      DELETE FROM sip_grupo WHERE id IN (20, 21);
    SQL
  end
end
