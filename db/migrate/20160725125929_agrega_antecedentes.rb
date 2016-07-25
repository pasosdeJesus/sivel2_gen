class AgregaAntecedentes < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (1,'AMENAZA','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion)          
        VALUES (2,'ATENTADO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (3,'DETENCION','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (4,'AMNISTIA - INDULTO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (5,'EXILIO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (6,'ALLANAMIENTO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (7,'DESAPARICION','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (8,'SECUESTRO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (9,'DESPLAZAMIENTO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (10,'SEGUIMIENTO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (11,'SEÑALAMIENTO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (12,'TORTURA','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (13,'OTRO','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (14,'SIN INFORMACIÓN','2001-01-29', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (15,'PILLAJE','2006-08-18', NULL);
      INSERT INTO sivel2_gen_antecedente
        (id, nombre, fechacreacion, fechadeshabilitacion) 
        VALUES (16,'MASACRE','2006-08-18', NULL);
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_antecedente WHERE id>='1' AND id<='16';
    SQL
  end
end
