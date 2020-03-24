json.set! caso.id do
    if caso.ubicacion
      ubi_prin = caso.ubicacion[0]
      byebug
      if ubi_prin
        json.pais Sip::Pais.find(ubi_prin.id_pais).nombre if ubi_prin.id_pais 
        json.departamento Sip::Departamento.find(ubi_prin.id_departamento).nombre if ubi_prin.id_departamento
        json.municipio Sip::Municipio.find(ubi_prin.id_municipio).nombre if ubi_prin.id_municipio
        json.centro_poblado Sip::Clase.find(ubi_prin.id_clase).nombre if ubi_prin.id_clase
        json.latitud ubi_prin.latitud if ubi_prin.latitud
        json.longitud ubi_prin.longitud if ubi_prin.longitud
      end
    end
  json.titulo caso.titulo
  json.fecha caso.fecha
end
