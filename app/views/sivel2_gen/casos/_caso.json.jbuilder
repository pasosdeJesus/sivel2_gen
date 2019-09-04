# frozen_string_literal: true

json.caso do
  json.id @caso.id
  json.titulo @caso.titulo if @caso.titulo
  json.hechos @caso.memo if @caso.memo
  json.fecha @caso.fecha if @caso.fecha
  json.hora @caso.hora if @caso.hora
  @caso.ubicacion.each do |ub|
    if @caso.ubicacion
      json.departamento ub.departamento.nombre if ub.departamento
      json.municipio ub.municipio.nombre if ub.municipio
      json.centro_poblado ub.clase.nombre if ub.clase
    end
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
