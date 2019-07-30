# frozen_string_literal: true

json.caso do
  json.id @caso.id
  json.titulo @caso.titulo
  json.hechos @caso.memo
  json.fecha @caso.fecha
  json.hora @caso.hora
  ub = Sip::Ubicacion.find(@caso.ubicacion_id)
  dep = ub.id_departamento
  mun = ub.id_municipio
  cen = ub.id_clase
  json.departamento Sip::Departamento.find(dep).nombre
  json.municipio Sip::Municipio.find(mun).nombre
  json.centro_poblado Sip::Clase.find(cen).nombre
  json.presponsables @caso.presponsable.each do |pr|
    json.id pr.id
    json.nombre pr.nombre
  end
  json.victimas @caso.victima.each do |v|
    json.set! v.persona.id, v.persona.nombres + ' ' + v.persona.apellidos
  end
end
