# vim: set expandtab tabstop=2 shiftwidth=2 fileencoding=utf-8:
# 
# Por compartir entre motores que operen sobre sivel2_gen 
#//= require msip/motor
#//= require cocoon
#//= require sivel2_gen/motor_es6
#//= require sivel2_gen/AutocompletaAjaxVictimas
#//= require sivel2_gen/AutocompletaAjaxFamiliares
#//= require sivel2_gen/AutocompletaAjaxColectivas

@sivel2_gen_procesa_eliminaracto = false
@sivel2_gen_procesa_eliminaractocolectivo = false



@sivel2_gen_cancelar_caso_eliminar_vacio = (caso) ->
  root = window
  purl = root.puntomontaje
  #validar dato importante por cada pestaña
  #basico
  nombre=$('#caso_titulo').val()
  #memo
  memo = $('#caso_memo').val()
  #ubicacion
  hay_departamentos = false
  departamentos = $('select[id^=caso_][id$=departamento_id]')
  departamentos.each(()->
    if $(this).val() != ''
      hay_departamentos = true
  )
  #fuentes de prensa
  hay_fuentes = false
  fuentes = $('select[id^=caso_][id$=fuenteprensa_id]')
  fuentes.each(()->
    if $(this).val() != ''
      hay_fuentes = true
  )
  #otras fuentes de prensa
  hay_otrasfuentes = false
  otrasfuentes = $('select[id^=caso_caso_fotra][id$=_nombre]')
  otrasfuentes.each(()->
    if $(this).val() != ''
      hay_otrasfuentes = true
  )
  #contexto
  contexto = $('#caso_contexto_ids').val()
  #presuntos responsble
  hay_presponsables = false
  presponsables = $('select[id^=caso_][id$=presponsable_id]')
  presponsables.each(()->
    if $(this).val().length != 0
      hay_presponsables = true
  )
  #un nombre en victima
  hay_victima = false
  victimas = $('input[id^=caso_victima][id$=_nombres]')
  victimas.each(()->
    if $(this).val() != ''
      hay_victima = true
  )
  #un nombre en victimacolectiva
  hay_victimacol = false
  victimascol = $('input[id^=caso_victimacolectiva][id$=_nombre]')
  victimascol.each(()->
    if $(this).val() != ''
      hay_victimacol = true
  )
  #un nombre en combatiente
  hay_combatientes = false
  combatientes = $('input[id^=caso_combatiente][id$=_nombre]')
  combatientes.each(()->
    if $(this).val() != ''
      hay_combatientes = true
  )
  #acto
  categoriaenacto = $('#caso_acto_categoria_id').val()
  #un adjunto en anexo
  hay_anexos = false
  anexos = $('input[id^=caso_anexo][id$=_adjunto]')
  anexos.each(()->
    if $(this).val() != ''
      hay_anexos = true
  )
  #etiquetas
  hay_etiquetas = false
  etiquetas = $('select[id^=caso_caso_etiqueta][id$=etiqueta_id]')
  etiquetas.each(()->
    if $(this).val().length != 0
      hay_etiquetas = true
  )
  #evaluacion
  confiabilidad = $('#caso_grconfiabilidad').val()
  if purl == '/'
    purl = ''
  if (nombre == '' && memo == '' && !hay_departamentos && !hay_presponsables && !hay_fuentes && !hay_otrasfuentes && contexto.length == 0 && !hay_victima && !hay_victimacol && !hay_combatientes && categoriaenacto.length == 0 && !hay_anexos && !hay_etiquetas && confiabilidad == '')
    casoId = caso
    $('#btn-cancelar-caso').attr('data-method', 'delete')
    $('#btn-cancelar-caso').attr('href', purl + '/casos/' + casoId)


# Elimina secciones agregadas con cocoon listadas en elempe
@elimina_pendientes = (elempe) ->
  for i, e of elempe
    l = e.find('.remove_fields')
    _cocoon_remove_fields(l)
  return

@elimina_destruidos = () ->
  $('input[id$=destroy][value=1]').closest('.control-group').remove()
  return

# Actualiza cuadro de selección con presuntos responsables
# s es un select jquery
@actualiza_presponsables = (s) ->
  sel = s.val()
  nh = ''
  lcg = $('#presponsables .control-group[style!="display: none;"]')
  lcg.each((k, v) ->
    id = $(v).find('select[data-actualiza=presponsable]').val()
    nh = nh + "<option value='" + id + "'"
    if id == sel 
      nh = nh + ' selected'
    tx = $(v).find('select[data-actualiza=presponsable] option[value=' + id + 
      ']').text()
    nh = nh + ">" + tx + "</option>" 
  )
  s.html(nh)
  return

# Actualiza cuadro de selección con víctimas
# s es un select jquery
@actualiza_victimas = (s) ->
  sel =s.val()
  nh = ''
  c = $('#contacto')
  lc = c.add('#victimas .control-group[style!="display: none;"]')
  lcg = lc.add('#datosbasicos')
  sinid = 0
  lcg.each((k, v) ->
    id = $(v).find('div').filter( () -> 
      if (typeof this.attributes.class != 'undefined' && typeof this.attributes.class.value  != 'undefined')
        return this.attributes.class.value.match(/caso_victima[_0-9]*persona_id/)
      else
        return null
    ).find('input').val()
    if (typeof id == 'undefined')
      id = $(v).find('div').filter( () -> 
        if (typeof this.attributes.class != 'undefined' && typeof this.attributes.class.value  != 'undefined')
          return this.attributes.class.value.match(/persona_id/)
        else
          return null
      ).find('input').val()
    nh = nh + "<option value='" + id + "'"
    if id == sel 
      nh = nh + ' selected'
    # texto: nombres apellidos
    nom = $(v).find('div').filter( () -> 
      if (typeof this.attributes.class != 'undefined' && typeof this.attributes.class.value  != 'undefined')
              return this.attributes.class.value.match(/caso_victima[_0-9]*persona_nombres/)
      else
        return null
    ).find('input').val()
    if (typeof nom == 'undefined')
      nom = $(v).find('div').filter( () -> 
        if (typeof this.attributes.class != 'undefined' && typeof this.attributes.class.value  != 'undefined')
          return this.attributes.class.value.match(/persona_nombres/)
        else
          return null
      ).find('input').val()
    ap = $(v).find('div').filter( () -> 
      if (typeof this.attributes.class != 'undefined' && typeof this.attributes.class.value  != 'undefined')
        return this.attributes.class.value.match(/caso_victima[_0-9]*persona_apellidos/)
      else 
        return null
    ).find('input').val()
    if (typeof ap == 'undefined')
      ap = $(v).find('div').filter( () -> 
        if (typeof this.attributes.class != 'undefined' && typeof this.attributes.class.value  != 'undefined')
          return this.attributes.class.value.match(/persona_apellidos/)
        else
          return null
      ).find('input').val()
    if (nom == 'N' && ap == 'N')
      sinid += 1
      tx = "PERSONA SIN IDENTIFICAR " + sinid
    else
      tx = (nom + " " + ap).trim()
    nh = nh + ">" + tx + "</option>" 
  )
  s.html(nh)
  return
 
# Actualiza cuadro de selección con víctimas
# s es un select jquery
@actualiza_gruposper = (s) ->
  sel =s.val()
  nh = ''
  lcg = $('#victimascolectivas .control-group[style!="display: none;"]')
  lcg.each((k, v) ->
    id = $(v).find('div').filter( () -> 
      this.attributes.class.value.match(/caso_victimacolectiva[_0-9]*grupoper_id/)
    ).find('input').val()
    if (typeof id == 'undefined')
      id = $(v).find('div').filter( () -> 
        this.attributes.class.value.match(/grupoper_id/)
      ).find('input').val()
    nh = nh + "<option value='" + id + "'"
    if id == sel 
      nh = nh + ' selected'
    nom = $(v).find('div').filter( () -> 
      this.attributes.class.value.match(/caso_victimacolectiva[_0-9]*grupoper_nombre/)
    ).find('input').val()
    if (typeof nom == 'undefined')
      nom = $(v).find('div').filter( () -> 
        this.attributes.class.value.match(/grupoper_nombre/)
      ).find('input').val()
    tx = nom.trim()
    nh = nh + ">" + tx + "</option>" 
  )
  s.html(nh)
  return

# AUTOCOMPLETACIÓN PERSONA
# Elije una persona en autocompletación
@autocompleta_persona = (label, id, victima_id, divcp, root) ->
  msip_arregla_puntomontaje(root)
  cs = id.split(";")
  persona_id = cs[0]
  pl = []
  ini = 0
  for i in [0..cs.length] by 1
     t = parseInt(cs[i])
     pl[i] = label.substring(ini, ini + t)
     ini = ini + t + 1
  # pl[1] cnom, pl[2] es cape, pl[3] es cdoc
  d = "victima_id=" + victima_id
  d += "&persona_id=" + persona_id
  a = root.puntomontaje + 'personas/remplazar'
  $.ajax(url: a, data: d, dataType: "html").fail( (jqXHR, texto) ->
    alert("Error: " + jqXHR.responseText)
  ).done( (e, r) ->
    divcp.html(e)
    $(document).trigger("msip:autocompleto_persona", [victima_id, persona_id])
    return
  )
  return

# Busca persona por nombre, apellido o identificación
# s es objeto con foco donde se busca persona
@busca_persona_nombre = (s, root) ->
  msip_arregla_puntomontaje(root)
  cnom = s.attr('id')
  v = $("#" + cnom).data('autocompleta')
  if (v != 1 && v != "no") 
    $("#" + cnom).data('autocompleta', 1)
    divcp = s.closest('.campos_persona')
    if (typeof divcp == 'undefined')
      alert('No se ubico .campos_persona')
      return
    idvictima = divcp.parent().find('.caso_victima_id').find('input').val()
    if (typeof idvictima == 'undefined')
      alert('No se ubico .caso_victima_id')
      return
    $("#" + cnom).autocomplete({
      source: root.puntomontaje + "personas.json",
      minLength: 2,
      select: ( event, ui ) -> 
        if (ui.item) 
          autocompleta_persona(ui.item.value, ui.item.id, idvictima, divcp, root)
          event.stopPropagation()
          event.preventDefault()
    })
  return


@ponerVariablesEdad = (root) ->
    if typeof root.campo_fecha_ref_edad == 'undefined'
      root.campo_fecha_ref_edad = 'caso_fecha'
    fechac = $('[id=' +  root.campo_fecha_ref_edad + ']')
    if (fechac.length == 0) 
      root.campo_fecha_ref_edad = 'caso_fecha'
    fechac = $('[id=' +  root.campo_fecha_ref_edad + ']')
    if (fechac.length == 0) 
      root.campo_fecha_ref_edad = 'caso_fecha'
    fechac = $('[id=' +  root.campo_fecha_ref_edad + ']')
    if (fechac.length >0) 
      vp = []
      if root.campo_fecha_ref_edad.endsWith('')
        vp = @msip_partes_fecha(fechac.val(), root.formato_fecha)
      else
        vp = @msip_partes_fecha(fechac.val(), 'yyyy-mm-dd')
      root.aniocaso = vp[0]
      root.mescaso = vp[1]
      root.diacaso = vp[2]
      root.anioactual = +$('#anioactual').val()
      root.mesactual = +$('#mesactual').val()
      root.diaactual = +$('#diaactual').val()
    else
      root.aniocaso = 0
      root.mescaso = 0
      root.diacaso = 0
      d = new Date()
      root.anioactual = d.getFullYear()
      root.mesactual = d.getMonth() + 1
      root.diaactual = d.getDate()

# Pone en blanco fecha de nacimiento y edades
@limpiarFechaNac = (prefIdPer,prefIdVic) ->
  $("[id=" + prefIdPer+ "_anionac]").val('')
  $("[id=" + prefIdPer+ "_mesnac]").val('')
  $("[id=" + prefIdPer+ "_dianac]").val('')
  $("[id=" + prefIdVic + "_edad]").val('')
  $("[id=" + prefIdVic + "_edadactual]").val('')
  $("[id=" + prefIdVic + "_rangoedad_id]").prop('disabled', false)


# Retorna cantidad de años entre la fecha de nacimiento y
# la fecha del hecho.
@edadDeFechaNac = (prefId, anioref, mesref, diaref) ->
  anionac= +$("[id=" + prefId + "_anionac]").val();
  mesnac= +$("[id=" + prefId + "_mesnac]").val();
  dianac= +$("[id=" + prefId + "_dianac]").val();
  #alert("OJO edad_de_fechanac anionac=" + anionac + ", anioref=" + anioref+ ", mesnac=" + mesnac + ", mesref=" + mesref+ ", dianac=" + dianac + ", diaref=" + diaref);
  msip_edadDeFechaNacFechaRef(anionac, mesnac, dianac, anioref, mesref, diaref)

# Utiliza campos escondidos para calcular el rango al cual corresponde una edad
@buscarRangoEdad = (edad) ->
    cantr = $('#rangoedad_cant').val()
    sin = -1
    res = -1
    for i in [0..cantr-1] 
      inf = +$('#rangoedad_d_' + i).data('inf')
      sup = +$('#rangoedad_d_' + i).data('sup')
      if (inf == -1) 
        sin = i
      else if (edad != '' && inf <= edad && edad <= sup) 
        res = i
   
    if (res == -1)
      res = sin
  
    resid = $('#rangoedad_d_' + res).val()
    return resid



# Establece rango de edad
@ponerRangoEdad = (prefId) ->
  edad = $("[id=" + prefId + "_edad]").val()
  r = $("[id=" + prefId + "_rangoedad_id]")
  if (edad == '') 
    r.prop('disabled', false)
  else 
    resid = buscarRangoEdad(edad)
    r.val(resid)
    r.prop('disabled', true)

  return

# Confirma antes de eliminar P. Responsable
@confirma_elim_dep_presponsable = (root, papa, nomelempe) ->
  # Ingresa 2 veces, evitando duplicar
  if (root.elempe && root.elempe.length>0) 
    return
  root.elempe = []
  esel=papa.find('select[data-actualiza=presponsable]')
  if (esel.length > 0) 
    idp = esel.val()
    otiguales = papa.siblings().filter('div[class*=control-group]').filter('div[style!="display: none;"]').find('select option[selected=selected][value=' + idp + ']')
    if (otiguales.length != 0)
      return
    nomesteelem = "este presunto responsable"
    $('#antecedentes .control-group[style!="display: none;"] .caso_acto_presponsable select').each((v, e) ->
      if ($(e).val() == idp) 
        root.elempe.push($(e).parent().parent());
    )
     
  if (root.elempe.length>0)
    r = confirm("Hay " + root.elempe.length + " " + nomelempe + 
      " que se eliminarán con " + nomesteelem + ", ¿Continuar?")
    if (r==false)
      papa.data('remove-cancel', 'true')
      root.elempe = []
    else
      papa.data('remove-cancel', 'false')
  return

# Confirma antes de eliminar Víctima
@confirma_elim_dep_victima = (root, papa, nomelempe) ->
  if (root.elempe && root.elempe.length>0) 
    return
  root.elempe = []
  vsel=papa.find('.caso_victima_persona_id input')
  if (vsel.length>0)
    idv = vsel.val()
    nomesteelem = "esta víctima"
    $('#antecedentes .control-group[style!="display: none;"] .caso_acto_persona select').each((v, e) ->
      if ($(e).val() == idv) 
        root.elempe.push($(e).parent().parent());
    )
     
  if (root.elempe.length>0)
    r = confirm("Hay " + root.elempe.length + " " + nomelempe + 
      " que se eliminarán con " + nomesteelem + ", ¿Continuar?")
    if (r==false)
      papa.data('remove-cancel', 'true')
      root.elempe = []
    else
      papa.data('remove-cancel', 'false')
  return

# Envia con AJAX datos del formulario, junto con el botón Contar.
# @param root Raiz del documento, para guardar allí variable global.
enviaFormularioContar= (root) ->
  f = $('form')
  a = f.attr('action')
  d = f.serialize()
  d += '&commit=Contar'
  # Parece que en ocasiones lanza 2 veces seguidas el mismo evento
  # y PostgreSQL produce error por 2 creaciones practicamente
  # simultaneas de la vista. Evitamos enviar lo mismo.
  if (!root.dant || root.dant != d)
    $.ajax(url: a, data: d, dataType: "script").fail( (jqXHR, texto) ->
      alert("Error: " + jqXHR.responseText)
    )
  root.dant = d 
  return


# Envia con método POST datos del formulario, junto con el botón Contar.
# @param root Raiz del documento, para guardar allí variable global.
enviaFormularioContarPost= (root) ->
  f = $('form')
  a = f.attr('action')
  d = f.serialize()
  d += '&commit=Contar'
  # Parece que en ocasiones lanza 2 veces seguidas el mismo evento
  # y PostgreSQL produce error por 2 creaciones practicamente
  # simultaneas de la vista. Evitamos enviar lo mismo.
  if (!root.dant || root.dant != d)
    msip_enviarautomatico_formulario($('form'), 'POST', 'script', true, 'Contar')
  root.dant = d 
  return


# Envía datos de la ficha del caso para guardar 
@enviarFichaCaso = ->
  msip_enviarautomatico_formulario($('form'), 'POST', 'json', false)
  elimina_destruidos()
  #actualiza_presponsables($('#caso_acto_presponsable_id'))
  #actualiza_presponsables($('#caso_actocolectivo_presponsable_id'))
  #actualiza_victimas($('#caso_acto_persona_id'))
  #actualiza_gruposper($('#caso_actocolectivo_grupoper_id'))

@sivel2_idTemp60 = -1

@sivel2_enviarFichaCasoCada60 = ->
  @sivel2_idTemp60 = window.setInterval(@enviarFichaCaso, 60000)

@sivel2_detenerEnviarCada60 = ->
  window.clearInterval(@sivel2_idTemp60)

@consultar_nns = () -> 
  victimas = $(".seccionvictima")
  sin_id = []
  con_id = []
  victimas.each(()->
    nombres = $(this).find("input[id$=nombres]").val() 
    apellidos = $(this).find("input[id$=apellidos]").val() 
    if nombres == "N"  && apellidos == "N"
      sin_id.push($(this))
    else
      con_id.push($(this))
  )
  $.each(sin_id, (index, valor)->
    identificacion = valor.find("input[id$=sin_identificacion]")
    identificacion.val("PERSONA SIN IDENTIFICAR " + (index + 1) )
  )
  $.each(con_id, (index, valor)->
    identificacion = valor.find("input[id$=sin_identificacion]")
    identificacion.val("PERSONA IDENTIFICADA" )
  )

# root es espacio para poner variables globales
# nomactospe es nombre por dar a actos 
#   (por ejemplo en sivel2_sjr es antecedentes/causas)
@sivel2_gen_prepara_eventos_comunes = (root, nomactospe) ->
  # root.putomontaje lo pudo poner msip_prepara_eventos_comunes
  if typeof root.puntomontaje == 'undefined'
    root.puntomontaje = '/'
 
  if root.puntomontaje[root.puntomontaje.length - 1] != '/'
    root.puntomontaje = root.puntomontaje + '/'

  $(document).on('cocoon:after-insert', (e) ->
    Msip__Motor.configurarElementosTomSelect()
  )
 
  #En ubicación por omisión Colombia y actualiza departamentos 
  $('#ubicaciones').on('cocoon:after-insert', '', (e, ubicacion) ->
    ubipais = 'select[id^=caso_][id$=pais_id]'
    Msip__Motor.configurarElementoTomSelect(e.target)
    llena_departamento($(ubicacion.find(ubipais)), root)
    if $(".ubicacion:visible").length == 1
      principal = $('input[type="checkbox"][name$="[principal]"]:visible')
      principal.prop('checked', true)
  )

  $('#ubicaciones').on('cocoon:after-remove', '', (e, ubicacion) ->
    if $('input[type="checkbox"][name$="[principal]"]:visible:checkbox:checked').length == 0
      ubis = $('input[type="checkbox"][name$="[principal]"]:visible')
      $(ubis[0]).prop('checked', true)
  )

  # En victimas permite autocompletar nombres de victima
  Sivel2GenAutocompletaAjaxVictimas.iniciar()
  Sivel2GenAutocompletaAjaxFamiliares.iniciar()
  Sivel2GenAutocompletaAjaxColectivas.iniciar()

  #$(document).on('focusin', 
  #'input[id^=caso_victima_attributes][id$=personados_attributes_nombres]', 
  #(e) ->
  #  sivel2_gen_busca_familiar_nombre($(this), root)
  #)

  # Al seleccionar ubicacion principal se desenmarcan las demas
  $(document).on('change', '#victimas input[id^=caso_victima][id$=_apellidos]', (e) ->
    consultar_nns()
    )
  $(document).on('change', '#victimas input[id^=caso_victima][id$=_nombres]', (e) ->
    consultar_nns()
    )

  # Al seleccionar ubicacion principal se desenmarcan las demas
  $(document).on('change', '#ubicaciones input[type=checkbox]', (e) ->
    otros = $('input[type="checkbox"][name$="[principal]"').not($(this))
    if $(this).is(':checked')
      otros.prop('checked', false)
  )

  # Al cambiar país se recalcula lista de departamentos
  $(document).on('change', 'select[id^=caso_][id$=pais_id]', (e) ->
    llena_departamento($(this), root)
    # Exprimentando actualizar a medida que se modifica:
    idfu = $(this).attr('id').replace('_pais_id', '_id');
    idu = $('#' + idfu).val();
    #if (idu > 0)
    #   $.ajax(url: '/ubicacion/' + idu + '/update/'
  )

  # Al cambiar departamento se recalcula lista de municipios
  $(document).on('change', 'select[id^=caso_][id$=departamento_id]', (e) ->
    llena_municipio($(this), root)
  )

  # Al cambiar municipio se recalcula lista de centros poblados
  $(document).on('change', 'select[id^=caso_][id$=municipio_id]', (e) ->
    llena_centropoblado($(this), root)
  )
  
  
  # Al cambiar centro poblado se muestra tipo
  $(document).on('change', 'select[id^=caso_][id$=centropoblado_id]', (e) ->
    centropoblado_id = $(this).val()
    select = $(this)
    b = root.puntomontaje + 'tipocentropoblado'
    $.ajax({
      url: b, 
      data: {id: centropoblado_id}, 
      dataType: "json", 
      success: (datos) ->
        tcentropoblado = datos.nombre
        div_padre = select.closest("div")
        div_tipo = div_padre.next()
        input_tipo = div_tipo.find("input[id^=caso_ubicacion][id$=tcentropoblado]")
        input_tipo.val(tcentropoblado)
      error: (jqXHR, texto) ->
        alert("Error: " + jqXHR.responseText)
   })
  )
  
  # Tras eliminar presponsable, eliminar dependientes
  $('#presponsables').on('cocoon:after-remove', '', (e, presponsable) ->
    elimina_pendientes(root.elempe);
    root.elempe = []
  )
 
  # Antes de eliminar presponsable confirmar si se eliminan dependientes
  # Antes de eliminar se confirman num de actos y actos colectivos
  # Y se eliminan de la tabla de actos y actos colectivos
  $('#presponsables').on('cocoon:before-remove', '', (e, papa) ->
    confirma_elim_dep_presponsable(root, papa, nomactospe)
    sel = papa[0].firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;
    prespon = sel.options[sel.selectedIndex].text;
    
    if $('#actos_tabla').length && $('#actoscolectivos_tabla').length
      tbodyactos = $('#actos_tabla')[0].firstElementChild.firstElementChild.nextElementSibling;
      
      tbodyactoscol = $('#actoscolectivos_tabla')[0].firstElementChild.firstElementChild.nextElementSibling;
      cont_actos = 0
      cont_actoscol = 0
      filas = tbodyactos.children;
      filascol = tbodyactoscol.children;
      ls = filas['length']-1
      lscol = filascol['length']-1
      if ls >= 0
        for i in [0..ls]
          fila = filas[i]
          pr = fila.firstElementChild.textContent
          if pr == prespon
            cont_actos += 1
      if lscol >= 0
        for i in [0..lscol]
          fila = filascol[i]
          pr = fila.firstElementChild.textContent
          if pr == prespon
            cont_actoscol += 1
      confirma = confirm('Se eliminarán ' + cont_actos + ' actos y ' +
              cont_actoscol + ' actos colectivos, ¿Desea continuar eliminando?');
      if !confirma
        e.preventDefault();
      else
        if ls >= 0
          for i in [0..ls]
            fila = filas[i]
            pr = fila.firstElementChild.textContent
            if pr == prespon
              btneliminar = fila.lastElementChild.firstElementChild
              $(btneliminar).trigger('click')
        if lscol >= 0
          for i in [0..lscol]
            fila = filascol[i]
            pr = fila.firstElementChild.textContent
            if pr == prespon
              btneliminar = fila.lastElementChild.firstElementChild
              $(btneliminar).trigger('click')
  )

  #Permite crear copias de victimas agregadas 
  @crea_copia_de_victima = (obj, fobj) ->
    div_victima = $(obj).parent().parent()
    valores= []
    div_victima.find(':input').each(()->
      valores.push($(this).val())
    )
    $('.add-vic').trigger("click")
    setTimeout(()->
      vic_agregada = $("#victimas div.seccionvictima:last")
      vic_agregada.find(':input').each((i)->
        if(i != 0 && i !=35)
          $(this).val(valores[i])
      )
    , 1000)

    return false;

  # Antes de eliminar víctima confirmar si se eliminan dependientes
  $('#victimas').on('cocoon:before-remove', '', (e, papa) ->
    confirma_elim_dep_victima(root, papa, nomactospe)
  )

  # Tras eliminar víctima, eliminar dependientes
  $('#victimas').on('cocoon:after-remove', '', (e, presponsable) ->
    elimina_pendientes(root.elempe);
    root.elempe = []
  )

  $(document).on('click', 'button#boton_filtro_avanzado', (e) ->
    if $(this).attr("aria-expanded") == 'true'
      $('#botones_finfiltro').removeClass("float-end").addClass("d-flex justify-content-center")
    else
      $('#botones_finfiltro').removeClass("d-flex justify-content-center").addClass("float-end")
    if $('#conscasos_q').is(':visible')
      $('#conscasos_q').hide()
    else
      $('#conscasos_q').show()
  )

  Sivel2GenMotorEs6.iniciar()

  # Elimina acto
  $(document).on('click', 'a.eliminaracto[href^="#"]', (e) ->
    e.preventDefault()
    e.stopPropagation()
    if (!@sivel2_gen_procesa_eliminaracto)
      @sivel2_gen_procesa_eliminaracto = true
      f = $('form')
      d = "acto_id=" + $(this).attr('data-eliminaracto')
      a = root.puntomontaje + 'actos/eliminar'
      $.ajax(url: a, data: d, dataType: "script").fail( (jqXHR, texto) ->
        alert("Error: " + jqXHR.responseText)
      ).done( (e) ->
        @sivel2_gen_procesa_eliminaracto = false
        Msip__Motor.configurarElementosTomSelect()
      )
  )

  # Elimina actocolectivo
  $(document).on('click', 'a.eliminaractocolectivo[href^="#"]', (e) ->
    e.preventDefault()
    e.stopPropagation()
    if (!@sivel2_gen_procesa_eliminaractocolectivo)
      @sivel2_gen_procesa_eliminaractocolectivo = true
      f = $('form')
      d = "actocolectivo_id=" + $(this).attr('data-eliminaractocolectivo')
      a = root.puntomontaje + 'actoscolectivos/eliminar'
      $.ajax(url: a, data: d, dataType: "script").fail( (jqXHR, texto) ->
        alert("Error: " + jqXHR.responseText)
      ).done( (e) ->
        @sivel2_gen_procesa_eliminaractocolectivo = false
      )
  )


  # Contar automático

  # ha afectado ficha caso en ocasiones, por eso se elije sólo los que
  # tengan afectando ficha caso 
  $(document).on('changeDate', '[data-contarautomatico]', 
    (e) -> setTimeout( (() -> enviaFormularioContar(root)), 200)
  )

  $(document).on('change', 'select[data-contarautomatico]', 
    (e) -> setTimeout( (() -> enviaFormularioContar(root)), 200)
  )

  $(document).on('change', 'input[data-contarautomatico]:not([data-behaviour])',
    (e) -> setTimeout( (() -> enviaFormularioContar(root)), 200)
  )

  $(document).on('changeDate', '[data-contarautomatico-post]', 
    (e) -> setTimeout( (()  -> enviaFormularioContarPost(root)), 200)
  )

  $(document).on('change', 'select[data-contarautomatico-post]', 
    (e) -> setTimeout( (() -> enviaFormularioContarPost(root)), 200)
  )

  $(document).on('change', 'input[data-contarautomatico-post]:not([data-behaviour])', 
    (e) -> setTimeout( (() -> enviaFormularioContarPost(root)), 200)
  )


  # Habilitar rangos de edad deshabilitados cuando se pone edad o año
  $(document).on('submit', 'form', (event) ->
    $("[id$=_rangoedad_id]").prop('disabled', false)
  )

  # Al cambiar fecha del hecho 
  # http://stackoverflow.com/questions/17009354/detect-change-to-selected-date-with-bootstrap-datepicker
  $(document).on('change', '#caso_fecha', (ev) ->
    #  Cambiar edades
    $('[id^=caso_victima_attributes][id$=persona_attributes_anionac]').change()
  )


  # En formulario usuario, cambia visibilidad de filtro para casos
  # dependiendo de si el grupo incluye 
  # 22 - Observador de parte de los casos
  $(document).on('change', 'select[id=usuario_grupo_ids]', (e) ->
    div_fini = $('.usuario_observadorffechaini')
    div_ffin = $('.usuario_observadorffechafin')
    div_fdep = $('.usuario_filtrodepartamento')
    if ($(this).val().includes('22'))
      div_fini.css("display", "block")
      div_ffin.css("display", "block")
      div_fdep.css("display", "block")
    else 
      div_fini.css("display", "none")
      div_ffin.css("display", "none")
      div_fdep.css("display", "none")
  )


  # Deshabilitar parte para obligar a completar partes para continuar
  # http://stackoverflow.com/questions/16777003/what-is-the-easiest-way-to-disable-enable-buttons-and-links-jquery-bootstrap
  #$('body').on('click', 'a.disabled', (e) -> 
  #  e.preventDefault() )

  # Obligar cálculo de edades al cargar 
  $('[id^=caso_victima_attributes][id$=persona_attributes_anionac]').change()

  $(document).on('turbo:click', (event) ->
    if (event.target.getAttribute('href').charAt(0) == '#') 
      return event.preventDefault()
  ) 

  $(document).on('change', '#filtro_tviolencia_id', (e) ->
    tviolencia_id = $(this).val()
    select = $(this)
    if tviolencia_id != "Z"
      b = root.puntomontaje + 'admin/categorias/filtratviolencia'
      $.ajax({
        url: b,
        data: {tviolencia: tviolencia_id}, 
        dataType: "json",
        success: (datos) ->
          div_padre = select.closest("div")
          div_grid = div_padre.parent()
          div_filtro = div_grid.parent().parent()
          input_cat = div_filtro.find("select[id=filtro_categoria_id]")
          Msip__Motor.configurarElementoTomSelect(input_cat.val(datos[0]))
        error: (jqXHR, texto) ->
          alert("Error: " + jqXHR.responseText)
       })
  )
  $(document).on('change', '#filtro_categoria_id', (e) ->
    categoria_id = $(this).val()
    select = $(this)
    b = root.puntomontaje + 'admin/categorias/filtratviolencia'
    $.ajax({
      url: b,
      data: {categorias_seleccionadas: categoria_id},
      dataType: "json",
      success: (datos) ->
        if datos[0] == false
          div_padre = select.closest("div")
          div_grid = div_padre.parent()
          div_filtro = div_grid.parent().parent()
          input_tipo = div_filtro.find("select[id=filtro_tviolencia_id]")
          Msip__Motor.configurarElementoTomSelect(input_tipo.val("Z"))
      error: (jqXHR, texto) ->
        alert("Error: " + jqXHR.responseText)
     })
  )
  return

@sivel2_gen_prepara_eventos_unicos = (root) ->

  # Envia formulario al presionar botones con clase fichacambia 
  # con más de 5 segundos de diferencia entre un click y el siguiente
  $(document).on('click', 'button.fichacambia[data-bs-target^="#"]', (e) ->
    e.preventDefault()
    tn = Date.now()
    d = -1
    if (root.tfichacambia) 
      d = (tn - root.tfichacambia)/1000
    if (d == -1 || d>5) 
      enviarFichaCaso()
      root.tfichacambia = Date.now()

    return
  )

  @msip_registra_cambios_para_bitacora(root)
  return


$(document).on('change', '#filtro_desagregar', (e) ->
  valor = this.value
  if valor == 'Departamento'
    fil_dep = $("#filtro_departamentos")
    fil_sex = $("#filtro_sexo")
    fil_cat = $("#filtro_categorias")
    fil_dep.parent().css('display', 'none')
    fil_sex.parent().css('display', 'block')
    fil_cat.parent().css('display', 'block')
  if valor == 'Categoria'
    fil_cat = $("#filtro_categorias")
    fil_dep = $("#filtro_departamentos")
    fil_sex = $("#filtro_sexo")
    fil_cat.parent().css('display', 'none')
    fil_dep.parent().css('display', 'block')
    fil_sex.parent().css('display', 'block')
  if valor == 'Sexo'
    fil_cat = $("#filtro_categorias")
    fil_dep = $("#filtro_departamentos")
    fil_sex = $("#filtro_sexo")
    fil_sex.parent().css('display', 'none')
    fil_dep.parent().css('display', 'block')
    fil_cat.parent().css('display', 'block')
)
