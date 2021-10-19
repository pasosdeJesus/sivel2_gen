class MejoraProfesiones < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_profesion 
        SET   nombre='ANTROPÓLOGO/A'
        WHERE nombre='ANTROPOLÓGO/A';
      UPDATE sivel2_gen_profesion 
        SET   nombre='CONDUCTOR/A'
        WHERE nombre='CONDUCTOR';
      UPDATE sivel2_gen_profesion 
        SET   nombre='CONTADOR/A PÚBLICO/A'
        WHERE nombre='CONTADOR PÚBLICO/A';
      UPDATE sivel2_gen_profesion 
        SET   nombre='INGENIERO/A FORESTAL'
        WHERE nombre='INGENIERO FORESTAL';
      UPDATE sivel2_gen_profesion 
        SET   nombre='LÍDER/EZA SOCIAL'
        WHERE nombre='LÍDER (SA) SOCIAL';
      UPDATE sivel2_gen_profesion 
        SET   nombre='MECÁNICO/A INDUSTRIAL'
        WHERE nombre='MECANICO INDUSTRIAL';
      UPDATE sivel2_gen_profesion 
        SET   nombre='MÉDICO/A TRADICIONAL'
        WHERE nombre='MÉDICO TRADICIONAL';
      UPDATE sivel2_gen_profesion 
        SET   nombre='MINERO/A'
        WHERE nombre='MINERO';
      UPDATE sivel2_gen_profesion 
        SET   nombre='PASTOR/A'
        WHERE nombre='PASTOR';
      UPDATE sivel2_gen_profesion 
        SET   nombre='PESCADOR/A'
        WHERE nombre='PESCADOR/RA';
      UPDATE sivel2_gen_profesion 
        SET   nombre='POLITÓLOGO/A'
        WHERE nombre='POLITOLOGA/O';
      UPDATE sivel2_gen_profesion 
        SET   nombre='SICÓLOGO/A'
        WHERE nombre='SICOLOGO (A)';
      UPDATE sivel2_gen_profesion 
        SET   nombre='SOLDADOR/A'
        WHERE nombre='SOLDADOR';
    SQL
    if Sivel2Gen::Profesion.where(id: 13).count>0 && 
        Sivel2Gen::Profesion.where(id: 107).count>0 &&
        Sivel2Gen::Profesion.find(13).nombre == 'ANTROPÓLOGO/A' && 
        Sivel2Gen::Profesion.find(107).nombre == 'ANTROPÓLOGO/A'
      execute <<-SQL
        UPDATE sivel2_gen_victima 
          SET id_profesion=13 WHERE id_profesion=107;
        UPDATE sivel2_gen_combatiente
          SET id_profesion=13 WHERE id_profesion=107;
        UPDATE sivel2_gen_profesion_victimacolectiva
          SET id_profesion=13 WHERE id_profesion=107;
        DELETE FROM sivel2_gen_profesion WHERE id=107;
      SQL
    end
  end
  def down
    execute <<-SQL
      UPDATE sivel2_gen_profesion 
        SET nombre='ANTROPOLÓGO/A'
        WHERE   nombre='ANTROPÓLOGO/A';
      UPDATE sivel2_gen_profesion 
        SET nombre='CONDUCTOR'
        WHERE   nombre='CONDUCTOR/A';
      UPDATE sivel2_gen_profesion 
        SET nombre='CONTADOR PÚBLICO/A'
        WHERE   nombre='CONTADOR/A PÚBLICO/A';
      UPDATE sivel2_gen_profesion 
        SET nombre='INGENIERO FORESTAL'
        WHERE   nombre='INGENIERO/A FORESTAL';
      UPDATE sivel2_gen_profesion 
        SET nombre='LÍDER (SA) SOCIAL'
        WHERE   nombre='LÍDER/EZA SOCIAL';
      UPDATE sivel2_gen_profesion 
        SET nombre='MECANICO INDUSTRIAL'
        WHERE   nombre='MECÁNICO/A INDUSTRIAL';
      UPDATE sivel2_gen_profesion 
        SET nombre='MÉDICO TRADICIONAL'
        WHERE   nombre='MÉDICO/A TRADICIONAL';
      UPDATE sivel2_gen_profesion 
        SET nombre='MINERO'
        WHERE   nombre='MINERO/A';
      UPDATE sivel2_gen_profesion 
        SET nombre='PASTOR'
        WHERE   nombre='PASTOR/A';
      UPDATE sivel2_gen_profesion 
        SET nombre='PESCADOR/RA'
        WHERE   nombre='PESCADOR/A';
      UPDATE sivel2_gen_profesion 
        SET nombre='POLITOLOGA/O'
        WHERE   nombre='POLITÓLOGO/A';
      UPDATE sivel2_gen_profesion 
        SET nombre='SICOLOGO (A)'
        WHERE   nombre='SICÓLOGO/A';
      UPDATE sivel2_gen_profesion 
        SET nombre='SOLDADOR'
        WHERE   nombre='SOLDADOR/A';
    SQL
  end
end
