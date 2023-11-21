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
        unless v.persona.numerodocumento.nil? || 
            v.persona.numerodocumento.empty?
          xml.docid (v.persona.tdocumento ? v.persona.tdocumento.sigla : 
                     '') + ' ' + v.persona.numerodocumento
        end
        xml.fecha_nacimiento v.persona.anionac,"-", 
          v.persona.mesnac.to_s.rjust(2, '0'),"-", 
          v.persona.dianac.to_s.rjust(2, '0')
        xml.sexo v.persona.sexo
        ['nacionalde', 'tdocumento'].each do |ob|
          xml.observaciones(v.persona[ob], 
                            {tipo: ob}) if v.persona[ob]
        end
        xml.observaciones(v.etnia.nombre, 
                          {tipo: 'etnia'}) if v.etnia
        xml.observaciones(v.persona.pais.nombre, 
                          {tipo: 'pais'}) if v.persona.pais
        xml.observaciones(v.persona.departamento.nombre, 
                          {tipo: 'departamento'}) if v.persona.departamento
        xml.observaciones(v.persona.municipio.nombre, 
                          {tipo: 'municipio'}) if v.persona.municipio
        xml.observaciones(v.persona.centropoblado.nombre, 
                          {tipo: 'centro_poblado'}) if v.persona.centropoblado
      end
    end
  end
  xml.comment! "Grupos victimizados"
  caso.victimacolectiva.each do |vc|
    xml.grupo do
      xml.id_grupo vc.grupoper.id
      xml.nombre_grupo vc.grupoper.nombre
      ['personasaprox','organizacionarmada'].each do |ob|
        xml.observaciones(vc.send(ob), {tipo: ob}) if vc.send(ob)
      end
      xml.observaciones(vc.grupoper.anotaciones,
                        {tipo: 'anotaciones'}) if vc.grupoper
      xml.observaciones(vc.antecedente.map(&:nombre).join(";"), 
                        {tipo: 'antecedente'}) if vc.antecedente[0]
      xml.observaciones(vc.filiacion.map(&:nombre).join(";"), 
                        {tipo: 'filiacion'}) if vc.filiacion[0]
      xml.observaciones(vc.organizacion.map(&:nombre).join(";"), 
                        {tipo: 'organizacion'}) if vc.organizacion[0]
      xml.observaciones(vc.profesion.map(&:nombre).join(";"), 
                        {tipo: 'profesion'}) if vc.profesion[0]
      xml.observaciones(vc.rangoedad.map(&:nombre).join(";"), 
                        {tipo: 'rangoedad'}) if vc.rangoedad[0]
      xml.observaciones(vc.sectorsocial.map(&:nombre).join(";"), 
                        {tipo: 'sectorsocial'}) if vc.sectorsocial[0]
      xml.observaciones(vc.vinculoestado.map(&:nombre).join(";"), 
                        {tipo: 'vinculoestado'}) if vc.vinculoestado[0]
      xml.observaciones(vc.etnia.map(&:nombre).join(";"),
                        {tipo: 'etnia'}) if vc.etnia[0]
    end
  end

  xml.comment! "Presuntos responsables"
  if caso.caso_presponsable
    caso.caso_presponsable.each do |cpr|
      xml.grupo do
        xml.id_grupo cpr.presponsable.id if cpr.presponsable
        xml.nombre_grupo cpr.presponsable.nombre if cpr.presponsable
        ['subdivision', 'bloque', 'frente',
         'otro'].each do |ob|
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
        xml.observaciones(v.contextovictima.map(&:nombre).join(";"), 
                          {tipo: 'contexto'}) if v.contextovictima[0]
        xml.observaciones(v.otraorga.map(&:nombre).join(";"), 
                          {tipo: 'otraorga'}) if v.otraorga[0]
        xml.observaciones(v.sectorsocialsec.map(&:nombre).join(";"), 
                          {tipo: 'sectorsocialsec'}) if v.sectorsocialsec[0]
        xml.observaciones(
          v.filiacion.nombre, {tipo: 'filiacion'}) if v.filiacion
        xml.observaciones(
          v.orientacionsexual,
                          {tipo: 'orientacionsexual'}) if v.orientacionsexual
        xml.observaciones(
          v.vinculoestado.nombre, {tipo: 'vinculoestado'}) if v.vinculoestado
        ['hijos', 'anotaciones'].each do |ob|
          xml.observaciones(v[ob], {tipo: ob}) if v[ob]
        end
        xml.observaciones(
          v['organizacionarmada'], {tipo: 'organizacion_armada'}
        ) if v['organizacionarmada']
        xml.observaciones(
          v.rangoedad.nombre, {tipo: 'rangoedad'}) if v.rangoedad
        xml.observaciones(v.antecedente.map(&:nombre).join(";"), 
                          {tipo: 'antecedente'}) if v.antecedente[0]
      end
    end
  end
  xml.comment! "Ubicacion"
  xml.fecha caso['fecha']      
  xml.hora caso['hora'] if caso['hora']
  xml.duracion caso['duracion'] if caso['duracion']
  if caso.ubicacion_id
    caso.ubicacion.each do |ub|
      if caso.ubicacion
        if ub.id == caso.ubicacion_id
         next
        end 
        xml.ubicacion_secundaria do
          xml.departamento ub.departamento.nombre if ub.departamento
          xml.municipio ub.municipio.nombre if ub.municipio
          xml.centro_poblado ub.centropoblado.nombre if ub.centropoblado
          xml.longitud ub.longitud  if ub.longitud
          xml.latitud ub.latitud  if ub.latitud
          xml.observaciones(ub.sitio, {tipo: 'sitio'}) if ub.sitio
          xml.observaciones(ub.lugar, {tipo: 'lugar'}) if ub.lugar
          xml.observaciones(ub.tsitio.nombre, {tipo: 'tsitio'}) if ub.tsitio
        end
      end
    end
    ub = Msip::Ubicacion.find(caso.ubicacion_id)
    xml.departamento ub.departamento.nombre if ub.departamento
    xml.municipio ub.municipio.nombre if ub.municipio
    xml.centro_poblado ub.centropoblado.nombre if ub.centropoblado
    xml.longitud ub.longitud  if ub.longitud
    xml.latitud ub.latitud  if ub.latitud
  end
  xml.comment! "Actos con Victimas Individuales"
  if caso.acto  
    caso.acto.each do |ac|
      xml.acto do
        xml.agresion !ac.categoria.pconsolidado.nil? ?
          ac.categoria.pconsolidado.clasificacion : 'OTRA'
        unless ac.categoria.nombre.nil? || ac.categoria.nombre.empty?
          xml.agresion_particular ac.categoria.nombre + ' (' + 
            ac.categoria.id.to_s + ')'
        end
        xml.id_victima_individual ac.persona.id
        xml.id_presunto_responsable_individual ac.presponsable.id
      end
    end
  end

  xml.comment! "Actos con Victimas Colectivas"
  caso.actocolectivo.each do |acol|
    xml.acto do
      if acol.categoria.pconsolidado.nil?
        xml.agresion "OTRO"
      else 
        xml.agresion acol.categoria.pconsolidado.clasificacion
      end
      unless acol.categoria.nombre.nil? || acol.categoria.nombre.empty?
        xml.agresion_particular acol.categoria.nombre + ' (' + 
          acol.categoria.id.to_s + ')'
      end
      xml.id_grupo_victima acol.grupoper.id
      xml.id_presunto_grupo_responsable acol.presponsable.id if acol.presponsable
    end
  end

  xml.comment! "Combatientes" 	
  if caso.combatiente 
    caso.combatiente.each do |co|
      xml.combatiente do
        xml.nombre co.nombre
        xml.alias co.alias
        xml.edad co.edad
        xml.sexo co.sexo
        xml.ocupacion co.profesion.nombre if co.profesion
        xml.sector_condicion co.sectorsocial.nombre if co.sectorsocial
        xml.organizacion co.organizacion.nombre.strip if co.organizacion
        xml.organizacion_armada co.presponsable.nombre if co.presponsable
        xml.resultado_agresion co.resagresion.nombre if co.resagresion
        xml.observaciones(
          co.rangoedad.nombre.strip, {tipo: 'rangoedad'}) if co.rangoedad
        xml.observaciones(
          co.filiacion.nombre.strip, {tipo: 'filiacion'}) if co.filiacion
        xml.observaciones(
          co.vinculoestado.nombre.strip, {tipo: 'vinculo_estado'}) if co.vinculoestado
        co.antecedente.each do |ante|
          xml.observaciones(ante.nombre.strip, 
                          {tipo: "contexto"})
        end
      end
    end
  end
  #OTROS
  xml.comment! "Otros" 	
  ['grconfiabilidad', 'gresclarecimiento', 'grimpunidad', 'grinformacion', 
   'bienes'].each do |c|
    xml.observaciones(caso[c], {tipo: c}) if caso[c]
  end

  xml.observaciones(
    caso.intervalo.nombre, 
    {tipo: 'intervalo'}) if caso.intervalo && caso.intervalo.nombre
  xml.observaciones(
    caso.region.map(&:nombre).join("; "), {tipo: 'region'}) if caso.region
    xml.observaciones(
      caso.frontera.map(&:nombre).join("; "),
        {tipo: 'frontera'}) if caso.frontera
  if ub
    xml.observaciones(ub.sitio, {tipo: 'sitio'}) if ub.sitio
    xml.observaciones(ub.lugar, {tipo: 'lugar'}) if ub.lugar
    xml.observaciones(ub.tsitio.nombre, {tipo: 'tsitio'}) if ub.tsitio
  end

  caso.contexto.each do |con|
    xml.observaciones(con.nombre, {tipo: 'contexto'}) if con
  end
end
