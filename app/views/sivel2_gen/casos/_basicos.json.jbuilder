# frozen_string_literal: true

json.set!(caso.id) do
  if caso.ubicacion_id
    ubi_prin = Msip::Ubicacion.find(caso.ubicacion_id)
    json.latitud(ubi_prin.latitud) if ubi_prin.latitud
    json.longitud(ubi_prin.longitud) if ubi_prin.longitud
    if ubi_prin.departamento && params && params[:filtro] &&
        params[:filtro][:inc_ubicaciones].to_i == 2
      json.departamento(ubi_prin.departamento.nombre)
      if ubi_prin.municipio
        json.municipio(ubi_prin.municipio.nombre)
      end
    end
  end
  json.titulo(caso.titulo)
  json.fecha(caso.fecha)
  if params && params[:filtro] && params[:filtro][:inc_memo].to_i == 2
    json.descripcion(caso.memo)
  end
end
