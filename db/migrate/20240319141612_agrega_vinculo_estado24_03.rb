# frozen_string_literal: true

class AgregaVinculoEstado2403 < ActiveRecord::Migration[7.1]
  def up
    if Sivel2Gen::Vinculoestado.where(id: 101).where(nombre: "EDIL").count == 1
      execute(<<-SQL)
        UPDATE sivel2_gen_victima SET vinculoestado_id=44 WHERE vinculoestado_id=101;
        DELETE FROM sivel2_gen_vinculoestado WHERE id=101;
      SQL
    elsif Sivel2Gen::Vinculoestado.where(id: 44).count == 0
      execute(<<-SQL)
        INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (44, 'EDIL', '2017-01-01', NULL, '2017-01-01', '2017-01-01', NULL);
      SQL
    end
    if Sivel2Gen::Vinculoestado.where(id: 102).where(nombre: "JUSTICIA ESPECIAL PARA LA PAZ-JEP").count == 1
      execute(<<-SQL)
        UPDATE sivel2_gen_victima SET vinculoestado_id=45 WHERE vinculoestado_id=102;
        DELETE FROM sivel2_gen_vinculoestado WHERE id=102;
      SQL
    elsif Sivel2Gen::Vinculoestado.where(id: 45).count == 0
      execute(<<-SQL)
        INSERT INTO public.sivel2_gen_vinculoestado (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (45, 'JUSTICIA ESPECIAL PARA LA PAZ (JEP)', '2023-01-01', NULL, '2023-01-01', '2023-01-01', 'Víctima trabajaba en la JEP');
      SQL
    end
  end

  def down
    execute(<<-SQL)
      DELETE FROM sivel2_gen_vinculoestado WHERE id IN (44, 45);
    SQL
  end
end
