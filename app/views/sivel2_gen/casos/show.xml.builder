xml.instruct!
xml.relato do
  xml.id_relato @caso['id']
  xml.organizacion_responsable ::Ability.organizacion_responsable
  xml.derechos ::Ability.derechos
  xml.fecha @caso['fecha']
  xml.hechos @caso['memo']
  @caso.victima.each do |v|
    xml.persona do
      xml.nombre v.persona.nombres
      xml.apellido v.persona.apellidos
      xml.docid v.persona.numdocumento
    end
  end
  # Grupos victimizados por hacerse
  # Presunto responsabe
  @caso.caso_presponsable.each do |cp|
    xml.grupo do
     xml.id_grupo cp['id_presponsable']
     xml.nombre_grupo cp.presponsable['nombre']
     #xml.observaciones(cp.anotaciones , {tipo: 'anotaciones'}) if cp.anotaciones
    end
  end
  ['grconfiabilidad', 'gresclarecimiento', 'grimpunidad', 'grinformacion',
   'id_intervalo', 'bienes'].each do |c|
    xml.observaciones(@caso[c], {tipo: c}) if @caso[c]
  end
end
