	
   xml.instruct!
   #xml.doc.create_internal_subset(
    #    'html',"-//W3C//DTD HTML 4.01 Transitional//EN", "http://sincodh.pasosdejesus.org/relatos/relatos-097.dtd"
   #)
   xml.relatos do
     xml.relato do
       xml.organizacion_responsable Sivel2Gen::Ability.organizacion_responsable
       xml.derechos Sivel2Gen::Ability.derechos
       xml.id_relato @caso ['id']
       #xml.forma_compartir
       xml.titulo @caso ['titulo']
       xml.hechos @caso['memo']

       xml.comment! "Personas"
       @caso.victima.each do |v|
          xml.persona do
            xml.id_persona v.persona.id
            xml.nombre v.persona.nombres
            xml.apellido v.persona.apellidos
            xml.cc v.persona.numerodocumento
            xml.fecha_nacimiento v.persona.anionac,"/", v.persona.mesnac,"/", v.persona.dianac
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

       xml.comment! "Victima Colectiva"

       xml.grupo do
         @caso.victimacolectiva.each do |vc|
            xml.id_grupo vc.grupoper.id
            xml.nombre_grupo vc.grupoper.nombre
	    ['personasaprox','organizacionarmada'].each do |ob|
	      xml.observaciones(vc[ob], {tipo: ob}) if vc[ob]
	    end
	
	    xml.observaciones(vc.antecedente.map(&:nombre).join(";"), {tipo: 'antecedente'}) if vc.antecedente[0]
	    xml.observaciones(vc.filiacion.map(&:nombre).join(";"), {tipo: 'filiacion'}) if vc.filiacion[0]
	    xml.observaciones(vc.organizacion.map(&:nombre).join(";"), {tipo: 'organizacion'}) if vc.organizacion[0]
	    .observaciones(vc.sectorsocial.map(&:nombre).join(";"), {tipo: 'sectorsocial'}) if vc.sectorsocial[0]
	    xml.observaciones(vc.vinculoestado.map(&:nombre).join(";"), {tipo: 'vinculoestado'}) if vc.vinculoestado[0]
           end
        end

        xml.comment! "Victima"
        @caso.victima.each do |v|
           xml.victima do
	      xml.id_persona v.persona.id
	      xml.ocupacion v.profesion.nombre
	      xml.sector_condicion v.sectorsocial.nombre
	      xml.iglesia v.iglesia.nombre
	      xml.organizacion v.organizacion.nombre
	      ['hijos','organizacionarmada', 'orientacionsexual', 'anotaciones'].each do |ob|
	        xml.observaciones(v[ob], {tipo: ob}) if v[ob]
	      end
	      xml.observaciones(v.filiacion.nombre, {tipo: 'filiacion'}) if v.filiacion
	      xml.observaciones(v.rangoedad.nombre, {tipo: 'rangoedad'}) if v.rangoedad
	      xml.observaciones(v.vinculoestado.nombre, {tipo: 'vinculoestado'}) if v.vinculoestado
           end
        end

        xml.comment! "Presuntos responsables individual"

        xml.comment! "Presuntos responsables grupo"
        @caso.caso_presponsable.each do |cpr|
          xml.grupo do
	    xml.id_grupo cpr.presponsable.id
	    xml.nombre cpr.presponsable.nombre
	    ['batallon', 'brigada', 'bloque', 'frente', 'division', 'otro', 'tipo'].each do |ob|
              xml.observaciones(cpr[ob], {tipo: ob}) if cpr[ob]
	    end
          # xml.observaciones(cpr.categoria[nombre], {tipo: ob})
          end
        end

        xml.comment! "Ubicacion"
        xml.fecha @caso['fecha']      
        xml.hora @caso['hora']
        xml.duracion @caso['duracion']
	@caso.ubicacion.each do |ub|
          xml.ubicacion do	
       	xml.departamento ub.departamento.nombre
        xml.municipio ub.municipio.nombre
	xml.centro_poblado ub.clase.nombre
	xml.longitud ub.longitud
	xml.latitud ub.latitud
	  end
        end
  	xml.comment! "Acto contra victima individual"
  	@caso.acto.each do |ac|
            xml.acto do
	       xml.agresion ac.categoria.pconsolidado.clasificacion
	       xml.agresion_particular ac.categoria.nombre
	       xml.id_victima_individual ac.persona.id
	       xml.id_presunto_grupo_responsable ac.presponsable.id
            end
        end

  	xml.comment! "Actos contra victimas colectivas"
  	@caso.actocolectivo.each do |acol|
     	   xml.acto do
	     xml.agresion acol.categoria.nombre
	     xml.id_victima_colectiva acol.grupoper.id
	     xml.id_presunto_grupo_responsable acol.presponsable.id
	   end
  	end
  	xml.contexto @caso['Contexto']

  	#OTROS
  	xml.comment! "Otros" 	
  	['grconfiabilidad', 'gresclarecimiento', 'grimpunidad', 'grinformacion', 'id_intervalo', 'bienes'].each do |c|
             xml.observaciones(@caso[c], {tipo: c}) if @caso[c]
  	end
  	xml.observaciones(@caso.intervalo.nombre, {tipo: 'intervalo'}) if @caso.intervalo
  	xml.observaciones(@caso['tsitio'], {tipo: 'tsitio'}) if @caso['tsitio']
   end
   end



