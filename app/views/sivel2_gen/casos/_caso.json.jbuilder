# frozen_string_literal: true

json.caso do
  json.id @caso.id
  json.titulo @caso.titulo
  json.hechos @caso.memo
  json.fecha @caso.fecha
  json.hora @caso.hora
  if @caso.ubicacion_id
    ub = Sip::Ubicacion.find(@caso.ubicacion_id)
    dep = ub.id_departamento
    mun = ub.id_municipio
    cen = ub.id_clase
    json.departamento Sip::Departamento.find(dep).nombre if dep
    json.municipio Sip::Municipio.find(mun).nombre if mun
    json.centro_poblado Sip::Clase.find(cen).nombre if cen
  end
  json.presponsables do
    @caso.presponsable.each do |pr|
      json.set! pr.id, pr.nombre if pr.id && pr.nombre
    end
  end
  json.victimas do
    @caso.victima.each do |v|
    json.set! v.persona.id, v.persona.nombres + ' ' + v.persona.apellidos
    end
  end
end
