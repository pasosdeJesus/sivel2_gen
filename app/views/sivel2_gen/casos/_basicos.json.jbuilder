json.set! caso.id do
  caso.ubicacion.each do |ub|
    if caso.ubicacion
      json.latitud ub.latitud if ub.latitud
      json.longitud ub.longitud if ub.longitud
    end
  end
  json.titulo caso.titulo
  json.fecha caso.fecha
end
