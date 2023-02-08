class PconsolidadoDihc < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_pconsolidado SET rotulo='AMENAZA' 
        WHERE rotulo='AMENAZAS';
      UPDATE sivel2_gen_pconsolidado SET rotulo='ATENTADO' 
        WHERE rotulo='ATENTADOS';
      UPDATE sivel2_gen_pconsolidado SET rotulo='LESIONADO' 
        WHERE rotulo='HERIDOS';
      UPDATE sivel2_gen_pconsolidado SET rotulo='MUERTO' 
        WHERE rotulo='MUERTOS';
      UPDATE sivel2_gen_pconsolidado SET tipoviolencia='VPS' 
        WHERE tipoviolencia='VP';
      UPDATE sivel2_gen_pconsolidado SET tipoviolencia='DIHC' 
        WHERE tipoviolencia='DIH';
      UPDATE sivel2_gen_pconsolidado SET 
        rotulo=rotulo || '-' || tipoviolencia;
      UPDATE sivel2_gen_categoria SET id_pconsolidado=NULL;
      UPDATE sivel2_gen_pconsolidado SET id=id+100 where id>3;
      UPDATE sivel2_gen_pconsolidado SET id=6 WHERE id=104; 
      UPDATE sivel2_gen_pconsolidado SET id=9 WHERE id=105; 
      UPDATE sivel2_gen_pconsolidado SET id=16 WHERE id=106; 
      UPDATE sivel2_gen_pconsolidado SET id=13 WHERE id=107; 
      UPDATE sivel2_gen_pconsolidado SET id=20 WHERE id=108; 
      UPDATE sivel2_gen_pconsolidado SET id=7 WHERE id=109; 
      UPDATE sivel2_gen_pconsolidado SET id=11 WHERE id=110; 
      UPDATE sivel2_gen_pconsolidado SET id=14 WHERE id=111; 
      UPDATE sivel2_gen_pconsolidado SET id=21 WHERE id=112; 
      UPDATE sivel2_gen_pconsolidado SET id=8 WHERE id=113; 
      UPDATE sivel2_gen_pconsolidado SET id=10 WHERE id=114; 
      UPDATE sivel2_gen_pconsolidado SET id=17 WHERE id=115; 
      UPDATE sivel2_gen_pconsolidado SET id=15 WHERE id=116; 
      UPDATE sivel2_gen_pconsolidado SET id=4 WHERE id=117; 
      UPDATE sivel2_gen_pconsolidado SET id=12 WHERE id=118; 
      UPDATE sivel2_gen_pconsolidado SET id=23 WHERE id=119; 
      UPDATE sivel2_gen_pconsolidado SET id=31 WHERE id=120; 
      UPDATE sivel2_gen_pconsolidado SET id=26 WHERE id=121; 
      UPDATE sivel2_gen_pconsolidado SET id=25, rotulo='RAPTO-VPS',
        tipoviolencia='VPS' WHERE id=122; 
      UPDATE sivel2_gen_pconsolidado SET id=24, rotulo='SECUESTRO-VPS', 
        tipoviolencia='VPS' WHERE id=123; 
      DELETE FROM sivel2_gen_pconsolidado WHERE id IN (124,125); 
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (5, 'DESAPARICIÓN-DIHC', 'DIHC', 'LIBERTAD', '0',
        '2018-10-17', '2018-10-17', '2018-10-17');
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (18, 'JUDICIALIZACIÓN ARBITRARIA-DH', 'DH', 'LIBERTAD', '0',
        '2018-10-17', '2018-10-17', '2018-10-17');
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (19, 'JUDICIALIZACIÓN ARBITRARIA-DIHC', 'DIHC', 'LIBERTAD', '0',
        '2018-10-17', '2018-10-17', '2018-10-17');
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (22, 'VIOLENCIA SEXUAL-VPS', 'VPS', 'INTEGRIDAD', '0',
        '2018-10-17', '2018-10-17', '2018-10-17');
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (27, 'ESCLAVITUD Y TRABAJOS FORZADOS-DIHC', 'DIHC', 
        'LIBERTAD', '0', '2018-10-17', '2018-10-17', '2018-10-17');
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (28, 'NEGACIÓN DE DERECHOS A PRISIONEROS DE GUERRA-DIHC', 
        'DIHC', 'LIBERTAD', '0', '2018-10-17', '2018-10-17', '2018-10-17');
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (29, 'NEGACIÓN DE ATENCIÓN A PERSONAS VULNERABLES-DIHC', 
        'DIHC', 'LIBERTAD', '0', '2018-10-17', '2018-10-17', '2018-10-17');
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (30, 'PROFANACIÓN Y OCULTAMIENTO DE CADAVERES-DIHC', 
        'DIHC', 'LIBERTAD', '0', '2018-10-17', '2018-10-17', '2018-10-17');
      INSERT INTO sivel2_gen_pconsolidado (id, rotulo, tipoviolencia, 
        clasificacion, peso, fechacreacion, created_at, updated_at) 
        VALUES (32, 'ESCUDO INDIVIDUAL-DIHC', 'DIHC', 'LIBERTAD', '0', 
        '2018-10-17', '2018-10-17', '2018-10-17');

      UPDATE sivel2_gen_pconsolidado SET 
        rotulo='NEGACIÓN DE DERECHOS A PRISIONERO DE GUERRA-DIHC' WHERE id='28';  
      UPDATE sivel2_gen_pconsolidado SET 
        rotulo='NEGACIÓN DE ATENCIÓN A PERSONA VULNERABLE-DIHC' WHERE id='29';  
      UPDATE sivel2_gen_pconsolidado SET 
        rotulo='PROFANACIÓN Y OCULTAMIENTO DE CADAVER-DIHC' WHERE id='30';  
      UPDATE sivel2_gen_pconsolidado SET 
        rotulo='RECLUTAMIENTO DE MENOR-DIHC' WHERE id='31';  

        UPDATE sivel2_gen_categoria SET tipocat='O' WHERE id IN ('64', '65');
        UPDATE sivel2_gen_categoria SET fechadeshabilitacion='2018-10-17'  
          WHERE id IN ('79', '910');

        UPDATE sivel2_gen_categoria SET 
          nombre='PROFANACIÓN Y OCULTAMIENTO DE CADAVER' WHERE id='718';
        UPDATE sivel2_gen_categoria SET 
          nombre='LESIÓN A CIVIL EN ACCIÓN BÉLICA' WHERE id='704';
        UPDATE sivel2_gen_categoria SET 
          nombre='RECLUTAMIENTO DE MENOR' WHERE id='75';
        UPDATE sivel2_gen_categoria SET 
          nombre='TOMA DE REHÉN' WHERE id='75';

    SQL
  end
end
