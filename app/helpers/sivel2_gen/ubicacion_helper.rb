module Sivel2Gen
  module UbicacionHelper

    def formato_ubicacion u, con_clase = true
      r = "";
      if u
        r = Sivel2Gen::Pais.find(u.id_pais).nombre
        if u.id_departamento
          r += " / " + Sivel2Gen::Departamento.where(id: u.id_departamento,
                 id_pais: u.id_pais).take.nombre
          if u.id_municipio
            r += " / " + Sivel2Gen::Municipio.where(id: u.id_municipio,
              id_departamento: u.id_departamento, 
              id_pais: u.id_pais).take.nombre
            if u.id_clase && con_clase
              r += " / " + Sivel2Gen::Clase.where(id: u.id_clase,
                id_municipio: u.id_municipio,
                id_departamento: u.id_departamento, 
                id_pais: u.id_pais).take.nombre
            end
          end
        end
      end
      return r
    end

  end
end
