# frozen_string_literal: true

module Sivel2Gen
  module UbicacionHelper
    def formato_ubicacion(u, con_centropoblado = true)
      r = ""
      if u
        r = Msip::Pais.find(u.pais_id).nombre
        if u.departamento_id
          r += " / " + Msip::Departamento.find_by(
            id: u.departamento_id,
          ).nombre
          if u.municipio_id
            r += " / " + Msip::Municipio.find_by(
              id: u.municipio_id,
            ).nombre
            if u.centropoblado_id && con_centropoblado
              r += " / " + Msip::Centropoblado.find_by(
                id: u.centropoblado_id,
              ).nombre
            end
          end
        end
      end
      r
    end
  end
end
