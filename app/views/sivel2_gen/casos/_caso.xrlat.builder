xml.relato do
  xml.organizacion_responsable Sivel2Gen::Ability.organizacion_responsable
  xml.derechos Sivel2Gen::Ability.derechos
  xml.id_relato caso ['id']
  xml.forma_compartir "publico" 
  xml.titulo caso ['titulo']
  xml.hechos caso['memo']

  xml.comment! "Victimas personas individuales"
  if caso.victima 
    caso.victima.each do |v|
      xml.persona do
        xml.id_persona v.persona.id
        xml.nombre v.persona.nombres
        xml.apellido v.persona.apellidos
        xml.cc v.persona.numerodocumento if v.persona.numerodocumento
        xml.fecha_nacimiento v.persona.anionac,"-", v.persona.mesnac.to_s.rjust(2, '0'),"-", v.persona.dianac.to_s.rjust(2, '0')
        xml.sexo v.persona.sexo
        ['nacionalde', 'tdocumento'].each do |ob|
          xml.observaciones(v.persona[ob], {tipo: ob}) if v.persona[ob]
        end
        xml.observaciones(v.etnia.nombre, {tipo: 'etnia'}) if v.etnia
        xml.observaciones(v.persona.pais.nombre, {tipo: 'pais'}) if v.persona.pais
        xml.observaciones(v.persona.departamento.nombre, {tipo: 'departamento'}) if v.persona.departamento
        xml.observaciones(v.persona.municipio.nombre, {tipo: 'municipio'}) if v.persona.municipio
        xml.observaciones(v.persona.clase.nombre, {tipo: 'centro_poblado'}) if v.persona.clase
      end
    end
  end
  xml.comment! "Grupos victimizados"
  caso.victimacolectiva.each do |vc|	      
    xml.grupo do
      xml.id_grupo vc.grupoper.id
      xml.nombre_grupo vc.grupoper.nombre
      ['personasaprox','organizacionarmada'].each do |ob|
        xml.observaciones(vc[ob], {tipo: ob}) if vc[ob]
      end
      xml.observaciones(vc.antecedente.map(&:nombre).join(";"), {tipo: 'antecedente'}) if vc.antecedente[0]
      xml.observaciones(vc.filiacion.map(&:nombre).join(";"), {tipo: 'filiacion'}) if vc.filiacion[0]
      xml.observaciones(vc.organizacion.map(&:nombre).join(";"), {tipo: 'organizacion'}) if vc.organizacion[0]
      xml.observaciones(vc.profesion.map(&:nombre).join(";"), {tipo: 'profesion'}) if vc.profesion[0]
      xml.observaciones(vc.rangoedad.map(&:nombre).join(";"), {tipo: 'rangoedad'}) if vc.rangoedad[0]
      xml.observaciones(vc.sectorsocial.map(&:nombre).join(";"), {tipo: 'sectorsocial'}) if vc.sectorsocial[0]
      xml.observaciones(vc.vinculoestado.map(&:nombre).join(";"), {tipo: 'vinculoestado'}) if vc.vinculoestado[0]
    end
  end

  xml.comment! "Presuntos responsables"
  if caso.caso_presponsable
    caso.caso_presponsable.each do |cpr|
      xml.grupo do
        xml.id_grupo cpr.presponsable.id
        xml.nombre_grupo cpr.presponsable.nombre
        ['batallon', 'brigada', 'bloque', 'frente', 'division', 'otro'].each do |ob|
          xml.observaciones(cpr[ob], {tipo: ob}) if cpr[ob]
        end
        # xml.observaciones(cpr.categoria[nombre], {tipo: ob})
      end
    end
  end

  xml.comment! "Victima Individual"
  if caso.victima
    caso.victima.each do |v|
      xml.victima do
        xml.id_persona v.persona.id if v.persona
        xml.ocupacion v.profesion.nombre if v.profesion
        xml.sector_condicion v.sectorsocial.nombre if v.sectorsocial
        xml.iglesia v.iglesia.nombre if v.iglesia
        xml.organizacion v.organizacion.nombre
        xml.observaciones(v.filiacion.nombre, {tipo: 'filiacion'}) if v.filiacion
        xml.observaciones(v.vinculoestado.nombre, {tipo: 'vinculoestado'}) if v.vinculoestado
        ['hijos', 'anotaciones'].each do |ob|
          xml.observaciones(v[ob], {tipo: ob}) if v[ob]
        end
        xml.observaciones(v['organizacionarmada'], {tipo: 'organizacion_armada'}) if v['organizacionarmada']
        xml.observaciones(v.rangoedad.nombre, {tipo: 'rangoedad'}) if v.rangoedad
      end
    end
  end

  xml.comment! "Presuntos responsables individuales"
  xml.comment! "Ubicacion"
  xml.fecha caso['fecha']      
  xml.hora caso['hora'] if caso['hora']
  xml.duracion caso['duracion'] if caso['duracion']
  if caso.ubicacion_id
    ub = Sip::Ubicacion.find(caso.ubicacion_id)
    xml.departamento ub.departamento.nombre if ub.departamento
    xml.municipio ub.municipio.nombre if ub.municipio
    xml.centro_poblado ub.clase.nombre if ub.clase
    xml.longitud ub.longitud  if ub.longitud
    xml.latitud ub.latitud  if ub.latitud

    caso.ubicacion.each do |ub|
      if caso.ubicacion
        if ub.id == caso.ubicacion_id
         next
        end 
        xml.ubicacion_secundaria do
          xml.departamento ub.departamento.nombre if ub.departamento
          xml.municipio ub.municipio.nombre if ub.municipio
          xml.centro_poblado ub.clase.nombre if ub.clase
          xml.longitud ub.longitud  if ub.longitud
          xml.latitud ub.latitud  if ub.latitud
        end
      end
    end
  end
  xml.comment! "Actos con Victimas Individuales"
  if caso.acto  
    caso.acto.each do |ac|
      xml.acto do
        xml.agresion ac.categoria.pconsolidado.clasificacion
        xml.agresion_particular ac.categoria.nombre
        xml.id_victima_individual ac.persona.id
        xml.id_presunto_grupo_responsable ac.presponsable.id
      end
    end
  end

  xml.comment! "Actos con Victimas Colectivas"
  caso.actocolectivo.each do |acol|
    xml.acto do
      xml.agresion acol.categoria.nombre
      xml.id_victima_colectiva acol.grupoper.id
      xml.id_presunto_grupo_responsable acol.presponsable.id
    end
  end

  #OTROS
  xml.comment! "Otros" 	
  ['grconfiabilidad', 'gresclarecimiento', 'grimpunidad', 'grinformacion', 'bienes'].each do |c|
    xml.observaciones(caso[c], {tipo: c}) if caso[c]
  end

  xml.observaciones(caso.intervalo.nombre, {tipo: 'intervalo'}) if caso.intervalo.nombre
  xml.observaciones(caso.region.map(&:nombre).join("; "), {tipo: 'region'}) if caso.region

  caso.ubicacion.each do |ubcaso|
    xml.observaciones(ubcaso.sitio, {tipo: 'sitio'}) if ubcaso.sitio
    xml.observaciones(ubcaso.lugar, {tipo: 'lugar'}) if ubcaso.lugar
    xml.observaciones(ubcaso.tsitio.nombre, {tipo: 'tsitio'}) if ubcaso.tsitio
  end

  caso.contexto.each do |con|
    xml.observaciones(con.nombre, {tipo: 'contexto'}) if con
  end

end




