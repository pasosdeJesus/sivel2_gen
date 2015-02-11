# vim: set expandtab tabstop=2 shiftwidth=2 fileencoding=utf-8:
# 
# Por compartir entre motores que operen sobre sivel2_gen

#//= require jquery-ui/autocomplete
#//= require cocoon
#//= require sivel2_gen/geo

# Elimina secciones agregadas con cocoon listadas en elempe
@elimina_pendientes = (elempe) ->
  for i, e of elempe
    l = e.find('.remove_fields')
    _cocoon_remove_fields(l)
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
  
# AUTOCOMPLETACIÓN PERSONA
# Elije una persona en autocompletación
@autocompleta_persona = (label, id, id_victima, divcp) ->
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
  a = '/personas/remplazar'
  $.ajax(url: a, data: d, dataType: "html").fail( (jqXHR, texto) ->
    alert("Error con ajax " + texto)
  ).done( (e, r) ->
    divcp.html(e)
    return
  )
  return

# Busca persona por nombre, apellido o identificación
# s es objeto con foco donde se busca persona
@busca_persona_nombre = (s) ->
  cnom = s.attr('id')
  v = $("#" + cnom).data('autocompleta')
  if (v != 1 && v != "no") 
    $("#" + cnom).data('autocompleta', 1)
    ctrl = s.closest('.controls')
    idvictima = ctrl.find('.caso_victima_id').find('input').val()
    if (typeof idvictima == 'undefined')
      alert('No se ubico .caso_victima_id')
      return
    divcp = ctrl.find('.campos_persona')
    if (typeof divcp == 'undefined')
      alert('No se ubico .campos_persona')
      return
    $("#" + cnom).autocomplete({
      source: "/personas.json",
      minLength: 2,
      select: ( event, ui ) -> 
        if (ui.item) 
          autocompleta_persona(ui.item.value, ui.item.id, idvictima, divcp)
          event.stopPropagation()
          event.preventDefault()
    })
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

# root es espacio para poner variables globales
# nomactospe es nombre por dar a actos 
#   (por ejemplo en sivel2_sjr es antecedentes/causas)
@prepara_eventos_comunes = (root, nomactospe) ->
  # Formato de campos de fecha con datepicker
  $(document).on('cocoon:after-insert', (e) ->
    $('[data-behaviour~=datepicker]').datepicker({
      format: 'yyyy-mm-dd'
      autoclose: true
      todayHighlight: true
      language: 'es'
    })
  )

  # En victimas permite autocompletar nombres
  $(document).on('focusin', 
  'input[id^=caso_victima_attributes][id$=persona_attributes_nombres]', 
  (e) ->
    busca_persona_nombre($(this))
  )

  # Al cambiar país se recalcula lista de departamentos
  $(document).on('change', 'select[id^=caso_][id$=id_pais]', (e) ->
    llena_departamento($(this))
    # Exprimentando actualizar a medida que se modifica:
    idfu = $(this).attr('id').replace('_id_pais', '_id');
    idu = $('#' + idfu).val();
    #if (idu > 0)
    #   $.ajax(url: '/ubicacion/' + idu + '/update/'
  )

  # Al cambiar departamento se recalcula lista de municipios
  $(document).on('change', 'select[id^=caso_][id$=id_departamento]', (e) ->
    llena_municipio($(this))
  )

  # Al cambiar municipio se recalcula lista de centros poblados
  $(document).on('change', 'select[id^=caso_][id$=id_municipio]', (e) ->
    llena_clase($(this))
  )

  # Tras eliminar presponsable, eliminar dependientes
  $('#presponsable').on('cocoon:after-remove', '', (e, presponsable) ->
    elimina_pendientes(root.elempe);
    root.elempe = []
  )
 
  # Antes de eliminar presponsable confirmar si se eliminan dependientes
  $('#presponsable').on('cocoon:before-remove', '', (e, papa) ->
    confirma_elim_dep_presponsable(root, papa, nomactospe)
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
 
  # En actos, lista de presuntos responsables se calcula
  $(document).on('focusin', 'select[id^=caso_acto_][id$=id_presponsable]', (e) ->
    actualiza_presponsables($(this))
  )

  # En actos, lista de víctimas se cálcula
  $(document).on('focusin', 'select[id^=caso_acto_][id$=id_persona]', (e) ->
    actualiza_victimas($(this))
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
      a='/actos/agregar'
      $.post(a, f.serialize())
      root.tagregaactos= Date.now()
    return
  )

  # Elimina acto
  $(document).on('click', 'a.eliminaracto[href^="#"]', (e) ->
    e.preventDefault()
    f = $('form')
    d = "id_acto=" + $(this).attr('data-eliminaracto')
    a = '/actos/eliminar'
    $.ajax(url: a, data: d, dataType: "script").fail( (jqXHR, texto) ->
      alert("Error con ajax " + texto)
    )
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
  #  $("article").css("cursor", "wait")
  #  $(this).parents("form").submit() 
  #  $("article").css("cursor", "default") 
  )


  # Deshabilitar parte para obligar a completar partes para continuar
  # http://stackoverflow.com/questions/16777003/what-is-the-easiest-way-to-disable-enable-buttons-and-links-jquery-bootstrap
  #$('body').on('click', 'a.disabled', (e) -> 
  #  e.preventDefault() )

  
  # Envia formulario al presionar enlaces con clase fichacambia 
  # con más de 5 segundos de diferencia entre un click y el siguiente
  $(document).on('click', 'a.fichacambia[href^="#"]', (e) ->
    tn = Date.now()
    d = -1
    if (root.tfichacambia) 
      d = (tn - root.tfichacambia)/1000
    if (d == -1 || d>5) 
      f=$('form')
      a=f.attr('action')
      $.post(a, f.serialize())
      actualiza_presponsables($('#caso_acto_id_presponsable'))
      actualiza_victimas($('#caso_acto_id_persona'))
      root.tfichacambia = Date.now()
    return
  )

  return


