class GrupoObservadorParte < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO public.sip_grupo (id, nombre, 
      fechacreacion, fechadeshabilitacion,
      created_at, updated_at) VALUES
      (22, 'Observador de una parte de los casos',
      '2020-11-30', NULL, 
      '2020-11-30', '2020-11-30');
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.sip_grupo WHERE id=22;
    SQL
  end
end
