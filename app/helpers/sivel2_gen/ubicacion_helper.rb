module Sivel2Gen
  module UbicacionHelper

    def formato_ubicacion u, con_clase = true
      r = "";
      if u
        r = Msip::Pais.find(u.id_pais).nombre
        if u.id_departamento
          r += " / " + Msip::Departamento.where(
						id: u.id_departamento).take.nombre
          if u.id_municipio
            r += " / " + Msip::Municipio.where(
							id: u.id_municipio).take.nombre
            if u.id_clase && con_clase
              r += " / " + Msip::Clase.where(
								id: u.id_clase).take.nombre
            end
          end
        end
      end
      return r
    end

  end
end
