module Sivel2Gen
  module UbicacionHelper

    def formato_ubicacion u, con_clase = true
      r = "";
      if u
        r = Msip::Pais.find(u.pais_id).nombre
        if u.departamento_id
          r += " / " + Msip::Departamento.where(
						id: u.departamento_id).take.nombre
          if u.municipio_id
            r += " / " + Msip::Municipio.where(
							id: u.municipio_id).take.nombre
            if u.clase_id && con_clase
              r += " / " + Msip::Clase.where(
								id: u.clase_id).take.nombre
            end
          end
        end
      end
      return r
    end

  end
end
