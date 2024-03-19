class AgregaVinculoEstado2403 < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
    INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (44, 'EDIL', '2017-01-01', NULL, '2017-01-01', '2017-01-01', NULL);
    INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (45, 'JUSTICIA ESPECIAL PARA LA PAZ (JEP)', '2023-01-01', NULL, '2023-01-01', '2017-01-01', 'Víctima trabajaba en la JEP');
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_vinculoestado WHERE id IN (44, 45);
    SQL
  end
end
