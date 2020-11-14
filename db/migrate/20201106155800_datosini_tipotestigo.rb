class DatosiniTipotestigo < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO public.sivel2_gen_tipotestigo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (1, 'SIN INFORMACIÓN', null, '2020-11-06', null, '2020-11-06', '2020-11-06');
      INSERT INTO public.sivel2_gen_tipotestigo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (2, 'Presencial', null, '2020-11-06', null, '2020-11-06', '2020-11-06');
      INSERT INTO public.sivel2_gen_tipotestigo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (3, 'Segundo grado', null, '2020-11-06', null, '2020-11-06', '2020-11-06');
      INSERT INTO public.sivel2_gen_tipotestigo (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at)
        VALUES (4, 'Otro', null, '2020-11-06', null, '2020-11-06', '2020-11-06');
      SELECT setval('public.sivel2_gen_tipotestigo_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.tipotestigo WHERE id>='1' AND id<='4'
    SQL
  end
end
