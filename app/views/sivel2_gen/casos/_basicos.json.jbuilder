json.set! caso.id do
  if caso.ubicacion_id
    ubi_prin = Sip::Ubicacion.find(caso.ubicacion_id)
    json.latitud ubi_prin.latitud if ubi_prin.latitud
    json.longitud ubi_prin.longitud if ubi_prin.longitud
    if ubi_prin.id_departamento
      dep = Sip::Departamento.find(ubi_prin.id_departamento).nombre
      json.departamento dep if dep
    end
    if ubi_prin.id_municipio
      mun = Sip::Municipio.find(ubi_prin.id_municipio).nombre
      json.municipio mun if mun
    end
  end
  json.titulo caso.titulo
  json.fecha caso.fecha
end
