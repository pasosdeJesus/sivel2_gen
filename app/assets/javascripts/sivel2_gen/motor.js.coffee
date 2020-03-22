# vim: set expandtab tabstop=2 shiftwidth=2 fileencoding=utf-8:
# 
# Por compartir entre motores que operen sobre sivel2_gen 
#//= require sip/motor
#//= require cocoon

@sivel2_gen_procesa_eliminaracto = false
@sivel2_gen_procesa_eliminaractocolectivo = false

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
  lcg = $('#presponsable .control-group[style!="display: none;"]')
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
  lcg = c.add('#victima .control-group[style!="display: none;"]')
  lcg.each((k, v) ->
    id = $(v).find('div').filter( () -> 
      this.attributes.class.value.match(/caso_victima[_0-9]*persona_id/)
    ).find('input').val()
    if (typeof id == 'undefined')
      id = $(v).find('div').filter( () -> 
        this.attributes.class.value.match(/persona_id/)
      ).find('input').val()
    nh = nh + "<option value='" + id + "'"
    if id == sel 
      nh = nh + ' selected'
    # texto: nombres apellidos
    nom = $(v).find('div').filter( () -> 
      this.attributes.class.value.match(/caso_victima[_0-9]*persona_nombres/)
    ).find('input').val()
    if (typeof nom == 'undefined')
      nom = $(v).find('div').filter( () -> 
        this.attributes.class.value.match(/persona_nombres/)
      ).find('input').val()
    ap = $(v).find('div').filter( () -> 
      this.attributes.class.value.match(/caso_victima[_0-9]*persona_apellidos/)
    ).find('input').val()
    if (typeof ap == 'undefined')
      ap = $(v).find('div').filter( () -> 
        this.attributes.class.value.match(/persona_apellidos/)
      ).find('input').val()
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
  lcg = $('#victimacolectiva .control-group[style!="display: none;"]')
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
    # texto: nombre
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
@autocompleta_persona = (label, id, id_victima, divcp, root) ->
  sip_arregla_puntomontaje(root)
  cs = id.split(";")
  id_persona = cs[0]
  pl = []
  ini = 0
  for i in [0..cs.length] by 1
     t = parseInt(cs[i])
     pl[i] = label.substring(ini, ini + t)
     ini = ini + t + 1
  # pl[1] cnom, pl[2] es cape, pl[3] es cdoc
  d = "id_victima=" + id_victima
  d += "&id_persona=" + id_persona
  a = root.puntomontaje + 'personas/remplazar'
  $.ajax(url: a, data: d, dataType: "html").fail( (jqXHR, texto) ->
    alert("Error: " + jqXHR.responseText)
  ).done( (e, r) ->
    divcp.html(e)
    $(document).trigger("sip:autocompleto_persona", [id_victima, id_persona])
    return
  )
  return

# Busca persona por nombre, apellido o identificación
# s es objeto con foco donde se busca persona
@busca_persona_nombre = (s, root) ->
  sip_arregla_puntomontaje(root)
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

# Elije un familiar en autocompletación
@sivel2_gen_autocompleta_familiar = (label, id, divcp, root) ->
  sip_arregla_puntomontaje(root)
  cs = id.split(";")
  id_persona = cs[0]
  pl = []
  ini = 0
  for i in [0..cs.length] by 1
     t = parseInt(cs[i])
     pl[i] = label.substring(ini, ini + t)
     ini = ini + t + 1
  # pl[1] es cnom, pl[2] es cape, pl[3] es cdoc
  d = "&id_persona=" + id_persona
  a = root.puntomontaje + 'personas/datos'
  $.ajax(url: a, data: d, dataType: "json").fail( (jqXHR, texto) ->
    alert("Error con ajax " + texto)
  ).done( (e, r) ->
    #debugger
    divcp.find('[id^=caso_victima_attributes][id$=personados_attributes_id]').val(e.id)
    divcp.find('[id^=caso_victima_attributes][id$=personados_attributes_nombres]').val(e.nombres)
    divcp.find('[id^=caso_victima_attributes][id$=personados_attributes_apellidos]').val(e.apellidos)
    divcp.find('[id^=caso_victima_attributes][id$=personados_attributes_sexo]').val(e.sexo)
    divcp.find('[id^=caso_victima_attributes][id$=personados_attributes_tdocumento]').val(e.tdocumento)
    divcp.find('[id^=caso_victima_attributes][id$=personados_attributes_numerodocumento]').val(e.numerodocumento)
    #$(document).trigger("sip:autocompleto_persona", [id_victima, id_persona])
    return
  )
  return

# Busca persona por nombre, apellido o identificación
# s es objeto con foco donde se busca persona
@sivel2_gen_busca_familiar_nombre = (s) ->
  root = window
  sip_arregla_puntomontaje(root)
  cnom = s.attr('id')
  v = $("#" + cnom).data('autocompleta')
  if (v != 1 && v != "no") 
    $("#" + cnom).data('autocompleta', 1)
    divcp = s.closest('.campos_personados')
    if (typeof divcp == 'undefined')
      alert('No se ubico .campos_personados')
      return
    idaa = divcp.parent().find('input[id$=personados_attributes_id').val()
    if (typeof idaa == 'undefined')
      alert('No se ubico personados_attributes_id')
      return
    $("#" + cnom).autocomplete({
      source: root.puntomontaje + "personas.json",
      minLength: 2,
      select: ( event, ui ) -> 
        if (ui.item) 
          sivel2_gen_autocompleta_familiar(ui.item.value, ui.item.id, divcp, root)
          event.stopPropagation()
          event.preventDefault()
    })
  return


# Elije una persona en autocompletación
@autocompleta_grupoper = (label, id, id_victimac, divcp, root) ->
  sip_arregla_puntomontaje(root)
  id_grupoper = id
#  pl = []
#  ini = 0
#  for i in [0..cs.length] by 1
#     t = parseInt(cs[i])
#     pl[i] = label.substring(ini, ini + t)
#     ini = ini + t + 1
  # pl[1] cnom
  d = "id_victimacolectiva=" + id_victimac
  d += "&id_grupoper=" + id_grupoper
  a = root.puntomontaje + 'gruposper/remplazar'
  $.ajax(url: a, data: d, dataType: "html").fail( (jqXHR, texto) ->
    alert("Error: " + jqXHR.responseText)
  ).done( (e, r) ->
    remp = e
    # Remplazamos la parte minima necesaria
    if $(e).find('.campos_grupoper').length == 1
      remp = $(e).find('.campos_grupoper').html()

    divcp.html(remp)
    $(document).trigger("sip:autocompleto_grupoper", [id_victimac, id_grupoper])
    return
  )
  return

# Busca un grupo de personas por nombre
# s es objeto con foco donde se busca 
@busca_grupoper_nombre = (s, root) ->
  sip_arregla_puntomontaje(root)
  cnom = s.attr('id')
  v = $("#" + cnom).data('autocompleta')
  if (v != 1 && v != "no") 
    $("#" + cnom).data('autocompleta', 1)
    divcp = s.closest('.campos_grupoper')
    if (typeof divcp == 'undefined')
      alert('No se ubico .campos_grupoper')
      return
    idvictimac = divcp.parent().find('.caso_victimacolectiva_id').find('input').val()
    if (typeof idvictimac == 'undefined')
      alert('No se ubico .caso_victimacolectiva_id')
      return
    $("#" + cnom).autocomplete({
      source: root.puntomontaje + "gruposper.json",
      minLength: 2,
      select: ( event, ui ) -> 
        if (ui.item) 
          autocompleta_grupoper(ui.item.value, ui.item.id, idvictimac, divcp, root)
          event.stopPropagation()
          event.preventDefault()
    })
  return


@ponerVariablesEdad = (root) ->
    if typeof root.campo_fecha_ref_edad == 'undefined'
      root.campo_fecha_ref_edad = 'caso_fecha_localizada'
    fechac = $('[id=' +  root.campo_fecha_ref_edad + ']')
    if (fechac.length == 0) 
      root.campo_fecha_ref_edad = 'caso_fecha_localizada'
    fechac = $('[id=' +  root.campo_fecha_ref_edad + ']')
    if (fechac.length == 0) 
      root.campo_fecha_ref_edad = 'caso_fecha'
    fechac = $('[id=' +  root.campo_fecha_ref_edad + ']')
    if (fechac.length >0) 
      vp = []
      if root.campo_fecha_ref_edad.endsWith('_localizada')
        vp = @sip_partes_fecha_localizada(fechac.val(), root.formato_fecha)
      else
        vp = @sip_partes_fecha_localizada(fechac.val(), 'yyyy-mm-dd')
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
  $("[id=" + prefIdVic + "_id_rangoedad]").prop('disabled', false)

# Retorna cantidad de años entre la fecha de nacimiento y
# la fecha del hecho.
@sivel2_gen_edadDeFechaNacFechaRef = (anionac, mesnac, dianac, anioref, mesref, diaref) ->
  if typeof anionac == 'undefined' || anionac == ''
    return -1
  if typeof anioref == 'undefined' || anioref == ''
    return -1

  na = anioref - anionac

  if typeof mesnac != 'undefined' && mesnac != '' && mesnac > 0 &&
  typeof mesref != 'undefined' && mesref!= '' && mesref > 0 &&
  mesnac >= mesref
    if mesnac > mesref || (dianac != 'undefined' && dianac != '' && 
    dianac > 0 && diaref != 'undefined' && diaref!= '' && 
    diaref > 0 && dianac > diaref)
      na--

  return na;


# Retorna cantidad de años entre la fecha de nacimiento y
# la fecha del hecho.
@edadDeFechaNac = (prefId, anioref, mesref, diaref) ->
  anionac= +$("[id=" + prefId + "_anionac]").val();
  mesnac= +$("[id=" + prefId + "_mesnac]").val();
  dianac= +$("[id=" + prefId + "_dianac]").val();
  #alert("OJO edad_de_fechanac anionac=" + anionac + ", anioref=" + anioref+ ", mesnac=" + mesnac + ", mesref=" + mesref+ ", dianac=" + dianac + ", diaref=" + diaref);
  sivel2_gen_edadDeFechaNacFechaRef(anionac, mesnac, dianac, anioref, mesref, diaref)

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
  r = $("[id=" + prefId + "_id_rangoedad]")
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

# Envía datos de la ficha del caso para guardar 
@enviarFichaCaso = ->
  sip_enviarautomatico_formulario($('form'), 'POST', 'json', false)
  elimina_destruidos()
  actualiza_presponsables($('#caso_acto_id_presponsable'))
  actualiza_presponsables($('#caso_actocolectivo_id_presponsable'))
  actualiza_victimas($('#caso_acto_id_persona'))
  actualiza_gruposper($('#caso_actocolectivo_id_grupoper'))

@sivel2_idTemp60 = -1

@sivel2_enviarFichaCasoCada60 = ->
    @sivel2_idTemp60 = window.setInterval(@enviarFichaCaso, 60000)

@sivel2_detenerEnviarCada60 = ->
    window.clearInterval(@sivel2_idTemp60)


# root es espacio para poner variables globales
# nomactospe es nombre por dar a actos 
#   (por ejemplo en sivel2_sjr es antecedentes/causas)
@sivel2_gen_prepara_eventos_comunes = (root, nomactospe) ->
  # root.putomontaje lo pudo poner sip_prepara_eventos_comunes
  if typeof root.puntomontaje == 'undefined'
    root.puntomontaje = '/'
 
  if root.puntomontaje[root.puntomontaje.length - 1] != '/'
    root.puntomontaje = root.puntomontaje + '/'

  # Formato de campos de fecha con datepicker
  $(document).on('cocoon:after-insert', (e) ->
    $('[data-behaviour~=datepicker]').datepicker({
      format: 'yyyy-mm-dd'
      autoclose: true
      todayHighlight: true
      language: 'es'
    })
    $('.chosen-select').chosen()
  )
 
  #En ubicación por omisión Colombia y actualiza departamentos 
  $('#ubicacion').on('cocoon:after-insert', '', (e, ubicacion) ->
    ubipais = 'select[id^=caso_][id$=id_pais]'
    $(ubipais).val(170).trigger('chosen:updated')
    llena_departamento($(ubicacion.find(ubipais)), root)
  )

  # En victimas permite autocompletar nombres de victima
  $(document).on('focusin', 
  'input[id^=caso_victima_attributes][id$=persona_attributes_nombres]', 
  (e) ->
    busca_persona_nombre($(this), root)
  )
  # En victimas permite autocompletar nombres de familiares
  $(document).on('focusin', 
  'input[id^=caso_victima_attributes][id$=personados_attributes_nombres]', 
  (e) ->
    sivel2_gen_busca_familiar_nombre($(this), root)
  )

  # En victimas colectivas permite autocompletar nombre
  $(document).on('focusin', 
  'input[id^=caso_victimacolectiva_attributes][id$=grupoper_attributes_nombre]', 
  (e) ->
    busca_grupoper_nombre($(this), root)
  )

  # Al cambiar país se recalcula lista de departamentos
  $(document).on('change', 'select[id^=caso_][id$=id_pais]', (e) ->
    llena_departamento($(this), root)
    # Exprimentando actualizar a medida que se modifica:
    idfu = $(this).attr('id').replace('_id_pais', '_id');
    idu = $('#' + idfu).val();
    #if (idu > 0)
    #   $.ajax(url: '/ubicacion/' + idu + '/update/'
  )

  # Al cambiar departamento se recalcula lista de municipios
  $(document).on('change', 'select[id^=caso_][id$=id_departamento]', (e) ->
    llena_municipio($(this), root)
  )

  # Al cambiar municipio se recalcula lista de centros poblados
  $(document).on('change', 'select[id^=caso_][id$=id_municipio]', (e) ->
    llena_clase($(this), root)
  )

  # Tras eliminar presponsable, eliminar dependientes
  $('#presponsable').on('cocoon:after-remove', '', (e, presponsable) ->
    elimina_pendientes(root.elempe);
    root.elempe = []
  )
 
  # Antes de eliminar presponsable confirmar si se eliminan dependientes
  # Antes de eliminar se confirman num de actos y actos colectivos
  # Y se eliminan de la tabla de actos y actos colectivos
  $('#presponsable').on('cocoon:before-remove', '', (e, papa) ->
    confirma_elim_dep_presponsable(root, papa, nomactospe)
    sel = papa[0].firstElementChild.firstElementChild.firstElementChild.firstElementChild.firstElementChild.nextElementSibling;
    prespon = sel.options[sel.selectedIndex].text;
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

  # Antes de eliminar víctima confirmar si se eliminan dependientes
  $('#victima').on('cocoon:before-remove', '', (e, papa) ->
    confirma_elim_dep_victima(root, papa, nomactospe)
  )

  # Tras eliminar víctima, eliminar dependientes
  $('#victima').on('cocoon:after-remove', '', (e, presponsable) ->
    elimina_pendientes(root.elempe);
    root.elempe = []
  )

  $(document).on('click', 'a#boton_filtro_avanzado', (e) ->
    if $('#conscasos_q').is(':visible')
      $('#conscasos_q').hide()
    else
      $('#conscasos_q').show()
  )

  # Agrega actos  
  $(document).on('click', 'a.agregaractos[href^="#"]', (e) ->
    e.preventDefault()
    tn = Date.now()
    d = -1
    if (root.tagregaactos) 
      d = (tn - root.tagregaactos)/1000
    if (d == -1 || d>5) 
      f=$('form')
      a = root.puntomontaje + 'actos/agregar'
      $.post(a, f.serialize())
      root.tagregaactos= Date.now()
    return
  )

  # Elimina acto
  $(document).on('click', 'a.eliminaracto[href^="#"]', (e) ->
    e.preventDefault()
    e.stopPropagation()
    if (!@sivel2_gen_procesa_eliminaracto)
      @sivel2_gen_procesa_eliminaracto = true
      f = $('form')
      d = "id_acto=" + $(this).attr('data-eliminaracto')
      a = root.puntomontaje + 'actos/eliminar'
      $.ajax(url: a, data: d, dataType: "script").fail( (jqXHR, texto) ->
        alert("Error: " + jqXHR.responseText)
      ).done( (e) ->
        @sivel2_gen_procesa_eliminaracto = false
      )
  )

  # Agrega actoscolectivos  
  $(document).on('click', 'a.agregaractoscolectivos[href^="#"]', (e) ->
    e.preventDefault()
    tn = Date.now()
    d = -1
    if (root.tagregaactoscolectivos) 
      d = (tn - root.tagregaactoscolectivos)/1000
    if (d == -1 || d>5) 
      f=$('form')
      a = root.puntomontaje + 'actoscolectivos/agregar'
      $.post(a, f.serialize())
      root.tagregaactoscolectivos= Date.now()
    return
  )

  # Elimina actocolectivo
  $(document).on('click', 'a.eliminaractocolectivo[href^="#"]', (e) ->
    e.preventDefault()
    e.stopPropagation()
    if (!@sivel2_gen_procesa_eliminaractocolectivo)
      @sivel2_gen_procesa_eliminaractocolectivo = true
      f = $('form')
      d = "id_actocolectivo=" + $(this).attr('data-eliminaractocolectivo')
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
    (e) -> enviaFormularioContar(root)
  )

  $(document).on('change', 'select[data-contarautomatico]', 
    (e) -> enviaFormularioContar(root)
  )

  $(document).on('change', 'input[data-contarautomatico]:not([data-behaviour])', 
    (e) -> enviaFormularioContar(root)
  )

  # Activar datepicker en campos que lo requieren
  $("input[data-behaviour='datepicker']").datepicker({
    format: 'yyyy-mm-dd'
    autoclose: true
    todayHighlight: true
    language: 'es'
  })

  # Variables para calcular edad y rango
  ponerVariablesEdad(root)
  root.mesactual = 0
  root.diaactual = 0

  $(document).on('change', 
  '[id^=caso_victima_attributes][id$=persona_attributes_anionac]', (event) ->
    root =  exports ? window
    anionac = $(this).val();
    prefIdVic = $(this).attr('id').slice(0, -27)
    prefIdPer = $(this).attr('id').slice(0, -8)
    ponerVariablesEdad(root)
    if (anionac == '') 
      limpiarFechaNac(prefIdPer, prefIdVic);
    else 
      $('[id=' + prefIdVic + '_edad]').val(
        edadDeFechaNac(prefIdPer, root.aniocaso, root.mescaso, root.diacaso))
      $('[id=' + prefIdVic + '_edadactual]').val(
        edadDeFechaNac(prefIdPer, root.anioactual, root.mesactual, root.diaactual))
    
    ponerRangoEdad(prefIdVic);
  );

  $(document).on('change', 
  "[id^=caso_victima_attributes][id$=persona_attributes_mesnac]", (event) ->
    root =  exports ? window
    prefIdVic = $(this).attr('id').slice(0, -26)
    prefIdPer = $(this).attr('id').slice(0, -7)
    ponerVariablesEdad(root)
    $('[id=' + prefIdVic + '_edad]').val(
      edadDeFechaNac(prefIdPer, root.aniocaso, root.mescaso, root.diacaso))
    $('[id=' + prefIdVic + '_edadactual]').val(
      edadDeFechaNac(prefIdPer, root.anioactual, root.mesactual, root.diaactual))
    ponerRangoEdad(prefIdVic);
  )

  $(document).on('change', 
  "[id^=caso_victima_attributes][id$=persona_attributes_dianac]", (event) ->
    root =  exports ? window
    prefIdVic = $(this).attr('id').slice(0, -26)
    prefIdPer = $(this).attr('id').slice(0, -7)
    ponerVariablesEdad(root)
    $('[id=' + prefIdVic + '_edad]').val(
      edadDeFechaNac(prefIdPer, root.aniocaso, root.mescaso, root.diacaso))
    $('[id=' + prefIdVic + '_edadactual]').val(
      edadDeFechaNac(prefIdPer, root.anioactual, root.mesactual, root.diaactual))
    ponerRangoEdad(prefIdVic);
  )

  $(document).on('change', 
  "[id^=caso_victima_attributes][id$=_edad]", (event) ->
    root =  exports ? window
    edad = $(this).val();
    prefIdVic = $(this).attr('id').slice(0, -5)
    prefIdPer = prefIdVic + '_persona_attributes'
    ponerVariablesEdad(root)
    if (edad == '') 
      limpiarFechaNac(prefIdPer, prefIdVic);
    else
      $("[id=" + prefIdPer + "_anionac]").val((+root.aniocaso) - (+edad));
      $("[id=" + prefIdPer + "_mesnac]").val('');
      $("[id=" + prefIdPer + "_dianac]").val('');
      $('[id=' + prefIdVic + '_edadactual]').val(
        edadDeFechaNac(prefIdPer, root.anioactual, root.mesactual, root.diaactual))

    ponerRangoEdad(prefIdVic);
  )

  $(document).on('change', 
  "[id^=caso_victima_attributes][id$=_edadactual]", (event) ->
    root =  exports ? window
    edadactual = $(this).val();
    prefIdVic = $(this).attr('id').slice(0, -11)
    prefIdPer = prefIdVic + '_persona_attributes'
    ponerVariablesEdad(root)
    if (edadactual == '')
      limpiarFechaNac(prefIdPer, prefIdVic);
    else
      $("[id=" + prefIdPer + "_anionac]").val((+root.anioactual) - 
      (+edadactual));
      $("[id=" + prefIdPer + "_mesnac]").val('');
      $("[id=" + prefIdPer + "_dianac]").val('');
      $('[id=' + prefIdVic + '_edad]').val(
        edadDeFechaNac(prefIdPer, root.aniocaso, root.mescaso, root.diacaso))

    ponerRangoEdad(prefIdVic);
  )

  # Habilitar rangos de edad deshabilitados cuando se pone edad o año
  $(document).on('submit', 'form', (event) ->
    $("[id$=_id_rangoedad]").prop('disabled', false)
  )

  # Al cambiar fecha del hecho 
  # Método para detectar cambios en datepicker de
  # http://stackoverflow.com/questions/17009354/detect-change-to-selected-date-with-bootstrap-datepicker
  $('#caso_fecha').datepicker({
    format: 'yyyy-mm-dd'
    autoclose: true
    todayHighlight: true
    language: 'es'
  }).on('changeDate', (ev) ->
    #  Cambiar edades
    $('[id^=caso_victima_attributes][id$=persona_attributes_anionac]').change()
  )


  # Deshabilitar parte para obligar a completar partes para continuar
  # http://stackoverflow.com/questions/16777003/what-is-the-easiest-way-to-disable-enable-buttons-and-links-jquery-bootstrap
  #$('body').on('click', 'a.disabled', (e) -> 
  #  e.preventDefault() )

  # Obligar cálculo de edades al cargar 
  $('[id^=caso_victima_attributes][id$=persona_attributes_anionac]').change()

  $(document).on('turbolinks:click', (event) ->
    if (event.target.getAttribute('href').charAt(0) == '#') 
      return event.preventDefault()
  ) 

  return

@sivel2_gen_prepara_eventos_unicos = (root) ->

  # Envia formulario al presionar enlaces con clase fichacambia 
  # con más de 5 segundos de diferencia entre un click y el siguiente
  $(document).on('click', 'a.fichacambia[href^="#"]', (e) ->
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

  return




