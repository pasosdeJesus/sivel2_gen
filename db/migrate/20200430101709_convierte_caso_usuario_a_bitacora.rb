class ConvierteCasoUsuarioABitacora < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO sip_bitacora (fecha, usuario_id, modelo, modelo_id,
        operacion, detalle, created_at, updated_at)
      (SELECT fechainicio, id_usuario, 'Sivel2Gen::Caso', id_caso, 
        'tocar', '{"origen": "caso_usuario"}', NOW(), NOW() 
        FROM sivel2_gen_caso_usuario WHERE id_usuario IN (SELECT id FROM usuario));
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM sip_bitacora WHERE operacion='tocar' AND
        (detalle->>'origen') = 'caso_usuario';
    SQL
  end
end
