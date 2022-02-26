class AjustaPconsolidado < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE public.sivel2_gen_pconsolidado SET nombre='MUERTOS-DH', tipoviolencia='DH', clasificacion='VIDA', peso=1, fechadeshabilitacion=NULL WHERE id=1;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='MUERTOS-DIHC', tipoviolencia='DIHC', clasificacion='VIDA', peso=2, fechadeshabilitacion=NULL WHERE id=2;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='MUERTOS-VPS', tipoviolencia='VPS', clasificacion='VIDA', peso=3, fechadeshabilitacion=NULL WHERE id=3;

      UPDATE public.sivel2_gen_pconsolidado SET nombre='DESAPARICIÓN-DH', tipoviolencia='DH', clasificacion='VIDA', peso=5, fechadeshabilitacion=NULL WHERE id=4;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='DESAPARICIÓN-DIHC', tipoviolencia='DIHC', clasificacion='LIBERTAD', peso=5, fechadeshabilitacion=NULL WHERE id=5;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='TORTURA-DH', tipoviolencia='DH', clasificacion='INTEGRIDAD', peso=6, fechadeshabilitacion=NULL WHERE id=6;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='TORTURA-DIHC', tipoviolencia='DIHC', clasificacion='INTEGRIDAD', peso=8, fechadeshabilitacion=NULL WHERE id=7;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='TORTURA-VPS', tipoviolencia='VPS', clasificacion='INTEGRIDAD', peso=7, fechadeshabilitacion=NULL WHERE id=8;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='LESIONADOS-DH', tipoviolencia='DH', clasificacion='INTEGRIDAD', peso=9, fechadeshabilitacion=NULL WHERE id=9;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='LESIONADOS-VPS', tipoviolencia='VPS', clasificacion='INTEGRIDAD', peso=10, fechadeshabilitacion=NULL WHERE id=11;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='LESIONADO-DIHC', tipoviolencia='DIHC', clasificacion='INTEGRIDAD', peso=11, fechadeshabilitacion=NULL WHERE id=10;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='DETENCIÓN ARBITRARIA-DH', tipoviolencia='DH', clasificacion='LIBERTAD', peso=12, fechadeshabilitacion=NULL WHERE id=12;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='AMENAZA-DH', tipoviolencia='DH', clasificacion='INTEGRIDAD', peso=13, fechadeshabilitacion=NULL WHERE id=13;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='AMENAZA-DIHC', tipoviolencia='DIHC', clasificacion='INTEGRIDAD', peso=15, fechadeshabilitacion=NULL WHERE id=14;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='AMENAZA-VPS', tipoviolencia='VPS', clasificacion='INTEGRIDAD', peso=14, fechadeshabilitacion=NULL WHERE id=15;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='ATENTADO-DH', tipoviolencia='DH', clasificacion='INTEGRIDAD', peso=16, fechadeshabilitacion=NULL WHERE id=16;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='ATENTADO-VPS', tipoviolencia='VPS', clasificacion='VIDA', peso=17, fechadeshabilitacion=NULL WHERE id=17;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='JUDICIALIZACIÓN ARBITRARIA-DH', tipoviolencia='DH', clasificacion='LIBERTAD', peso=18, fechadeshabilitacion=NULL WHERE id=18;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='JUDICIALIZACIÓN ARBITRARIA-DIHC', tipoviolencia='DIHC', clasificacion='LIBERTAD', peso=19, fechadeshabilitacion=NULL WHERE id=19;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='VIOLENCIA SEXUAL-DH', tipoviolencia='DH', clasificacion='INTEGRIDAD', peso=20, fechadeshabilitacion=NULL WHERE id=20;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='VIOLENCIA SEXUAL-DIHC', tipoviolencia='DIHC', clasificacion='INTEGRIDAD', peso=22, fechadeshabilitacion=NULL WHERE id=21;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='VIOLENCIA SEXUAL-VPS', tipoviolencia='VPS', clasificacion='INTEGRIDAD', peso=21, fechadeshabilitacion=NULL WHERE id=22;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='DEPORTACIÓN-DH', tipoviolencia='DH', clasificacion='LIBERTAD', peso=23, fechadeshabilitacion=NULL WHERE id=23;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='SECUESTRO-VPS', tipoviolencia='VPS', clasificacion='LIBERTAD', peso=24, fechadeshabilitacion=NULL WHERE id=24;
      UPDATE public.sivel2_gen_pconsolidado SET nombre='RAPTO-VPS', tipoviolencia='VPS', clasificacion='INTEGRIDAD', peso=25, fechadeshabilitacion=NULL WHERE id=25;


      INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (26, 'TOMA DE REHENES-DIHC', 'DIHC', 'INTEGRIDAD', 26, '2001-01-01', NULL, NULL, '2020-09-22 19:33:45.214749', '') ON CONFLICT (id) DO NOTHING;

      INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (26, 'TOMA DE REHENES-DIHC', 'DIHC', 'INTEGRIDAD', 26, '2001-01-01', NULL, NULL, '2020-09-22 19:33:45.214749', '') ON CONFLICT (id) DO NOTHING;
      INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (27, 'ESCLAVITUD Y TRABAJOS FORZADOS-DIHC', 'DIHC', 'LIBERTAD', 27, '2018-10-17', NULL, '2018-10-17 00:00:00', '2020-09-22 19:34:03.550226', '') ON CONFLICT DO NOTHING;
      INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (28, 'NEGACIÓN DE DERECHOS A PRISIONERO DE GUERRA-DIHC', 'DIHC', 'LIBERTAD', 28, '2018-10-17', NULL, '2018-10-17 00:00:00', '2020-09-22 19:34:13.619907', '') ON CONFLICT DO NOTHING;
     INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (29, 'NEGACIÓN DE ATENCIÓN A PERSONA VULNERABLE-DIHC', 'DIHC', 'LIBERTAD', 29, '2018-10-17', NULL, '2018-10-17 00:00:00', '2020-09-22 19:34:21.713478', '') ON CONFLICT DO NOTHING;
     INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (30, 'PROFANACIÓN Y OCULTAMIENTO DE CADAVER-DIHC', 'DIHC', 'LIBERTAD', 30, '2018-10-17', NULL, '2018-10-17 00:00:00', '2020-09-22 19:34:29.494072', '') ON CONFLICT DO NOTHING;
      INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (31, 'RECLUTAMIENTO DE MENOR-DIHC', 'DIHC', 'INTEGRIDAD', 31, '2001-01-01', NULL, NULL, '2020-09-22 19:34:40.062109', '') ON CONFLICT DO NOTHING;
    INSERT INTO public.sivel2_gen_pconsolidado (id, nombre, tipoviolencia, clasificacion, peso, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (32, 'ESCUDO INDIVIDUAL-DIHC', 'DIHC', 'LIBERTAD', 32, '2018-10-17', NULL, '2018-10-17 00:00:00', '2020-09-22 19:34:51.654596', '') ON CONFLICT DO NOTHING;


      UPDATE sivel2_gen_categoria SET id_pconsolidado=1 WHERE id IN (10,30,20);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=2 WHERE id IN (87,97,701,703);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=3 WHERE id IN (40,50);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=4 WHERE id IN (11,21,302);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=5 WHERE id IN (76);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=6 WHERE id IN (22,36,12);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=7 WHERE id IN (72);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=8 WHERE id IN (47,56);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=9 WHERE id IN (33,23,13);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=10 WHERE id IN (88,98,702,704);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=11 WHERE id IN (43,53);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=12 WHERE id IN (14,24,301);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=13 WHERE id IN (25,35,15);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=14 WHERE id IN (73);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=15 WHERE id IN (45,55);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=16 WHERE id IN (26,37,16);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=17 WHERE id IN (46,57);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=18 WHERE id IN (141,241,341);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=19 WHERE id IN (715);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=20 WHERE id IN (29,39,19);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=21 WHERE id IN (77);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=22 WHERE id IN (420,520);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=23 WHERE id IN (101);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=24 WHERE id IN (41);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=25 WHERE id IN (48,58);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=26 WHERE id IN (74);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=27 WHERE id IN (714);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=28 WHERE id IN (716);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=29 WHERE id IN (717);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=30 WHERE id IN (718);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=31 WHERE id IN (75);
      UPDATE sivel2_gen_categoria SET id_pconsolidado=32 WHERE id IN (78);
    SQL
  end
  def down
    execute <<-SQL
    SQL
  end
end
