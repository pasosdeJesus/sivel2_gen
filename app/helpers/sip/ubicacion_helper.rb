module Sip
  module UbicacionHelper

    def formato_ubicacion u, con_clase = true
      r = "";
      if u
        r = Sip::Pais.find(u.id_pais).nombre
        if u.id_departamento
          r += " / " + Sip::Departamento.where(
						id: u.id_departamento).take.nombre
          if u.id_municipio
            r += " / " + Sip::Municipio.where(
							id: u.id_municipio).take.nombre
            if u.id_clase && con_clase
              r += " / " + Sip::Clase.where(
								id: u.id_clase).take.nombre
            end
          end
        end
      end
      return r
    end

  end
end
