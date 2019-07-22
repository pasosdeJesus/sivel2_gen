json.set! @caso.id do 
json.latitud @caso.ubicacion.latitud
json.longitud @caso.ubicacion.longitud
json.titulo @caso.titulo
json.hora @caso.hora
end
