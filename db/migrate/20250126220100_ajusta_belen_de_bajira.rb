# frozen_string_literal: true

class AjustaBelenDeBajira < ActiveRecord::Migration[7.2]
  def up
    if Msip::Municipio.where(id: 1466).where("TRIM(nombre)='Belén de Bajirá'")
      execute(<<-SQL)
       UPDATE msip_ubicacion SET municipio_id=1799 WHERE municipio_id=1466;
       DELETE FROM msip_municipio WHERE id=1466;
      SQL
    end
  end

  def down
    execute(<<-SQL)
      INSERT INTO public.msip_municipio (munlocal_cod, nombre, fechacreacion, fechadeshabilitacion, latitud, longitud, created_at, updated_at, departamento_id, id, observaciones, codreg, ultvigenciaini, ultvigenciafin, tipomun, svgruta, svgcdx, svgcdy, svgcdancho, svgcdalto, svgrotx, svgroty) VALUES (981, 'Belén de Bajirá', '2001-01-01', NULL, NULL, NULL, NULL, NULL, 29, 1466, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      UPDATE msip_ubicacion SET municipio_id=1466 WHERE municipio_id=1799;
    SQL
  end
end
