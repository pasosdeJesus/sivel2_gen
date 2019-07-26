json.set! caso.id do
if caso.ubicacion_id
  ub = Sip::Ubicacion.find(caso.ubicacion_id)
  lat = ub.latitud
  lon = ub.longitud
  json.latitud lat
  json.longitud lon
end
json.titulo caso.titulo
json.hora caso.hora
end
