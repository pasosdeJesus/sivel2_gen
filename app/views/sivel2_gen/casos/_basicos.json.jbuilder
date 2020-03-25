json.set! caso.id do
    if caso.ubicacion
      ubi_prin = Sip::Ubicacion.find(caso.ubicacion_id)
      if ubi_prin
        json.latitud ubi_prin.latitud if ubi_prin.latitud
        json.longitud ubi_prin.longitud if ubi_prin.longitud
      end
    end
  json.titulo caso.titulo
  json.fecha caso.fecha
end
