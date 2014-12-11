# vim: set expandtab tabstop=2 shiftwidth=2 fileencoding=utf-8:
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

#//= require cocoon
#//= require sivel2_gen/geo

# Elimina secciones agregadas con cocoon listadas en elempe
eliminaPendientes = (elempe) ->
  for i, e of elempe
    l = e.find('.remove_fields')
    _cocoon_remove_fields(l)


$(document).on 'ready page:load',  -> 

  root = exports ? this

  $(document).on('cocoon:after-insert', (e) ->
    $('[data-behaviour~=datepicker]').datepicker({
      format: 'yyyy-mm-dd'
      autoclose: true
      todayHighlight: true
      language: 'es'
    })
  )

  # En actos, lista de presuntos responsables se calcula
  $(document).on('focusin', 'select[id^=caso_acto_attributes_][id$=id_presponsable]', (e) ->
    #debugger
    sel = $(this).val()
    nh = ''
    lcg = $('#presponsable .control-group[style!="display: none;"]')
    lcg.each((k, v) ->
      id = $(v).find('select[data-actualiza=presponsable]').val()
      nh = nh + "<option value='" + id + "'"
      if id == sel 
        nh = nh + ' selected'
      tx = $(v).find('select[data-actualiza=presponsable] option[value=' + id + ']').text()
      nh = nh + ">" + tx + "</option>" )
    $(this).html(nh)
  )

  # En actos, lista de víctimas se cálcula
  $(document).on('focusin', 'select[id^=caso_acto_attributes_][id$=id_persona]', (e) ->
    sel = $(this).val()
    nh = ''
    c = $('#contacto')
    lcg = c.add('#victima .control-group[style!="display: none;"]')
    lcg.each((k, v) ->
      # id: persona
      # Nos gustaría 
      # id = $(v).find('.caso_victima_persona_id input').val()
      # pero como nombre de clase genera caso_victima_279_persona_id
      id = $(v).find('div').filter( () -> this.attributes.class.value.match(/caso_victima[_0-9]*persona_id/)).find('input').val()
      nh = nh + "<option value='" + id + "'"
      if id == sel 
        nh = nh + ' selected'
      # texto: nombres apellidos
      nom = $(v).find('div').filter( () -> this.attributes.class.value.match(/caso_victima[_0-9]*persona_nombres/)).find('input').val()
      ap = $(v).find('div').filter( () -> this.attributes.class.value.match(/caso_victima[_0-9]*persona_apellidos/)).find('input').val()
      tx = (nom + " " + ap).trim()
      nh = nh + ">" + tx + "</option>" )
    $(this).html(nh)
  )

  # Al cambiar país se recalcula lista de departamentos
  $(document).on('change', 'select[id^=caso_][id$=id_pais]', (e) ->
    llenaDepartamento($(this))
    # Exprimentando actualizar a medida que se modifica:
    idfu = $(this).attr('id').replace('_id_pais', '_id');
    idu = $('#' + idfu).val();
    #if (idu > 0)
    #   $.ajax(url: '/ubicacion/' + idu + '/update/'
  )

  # Al cambiar departamento se recalcula lista de municipios
  $(document).on('change', 'select[id^=caso_][id$=id_departamento]', (e) ->
    llenaMunicipio($(this))
  )

  # Al cambiar municipio se recalcula lista de centros poblados
  $(document).on('change', 'select[id^=caso_][id$=id_municipio]', (e) ->
    llenaClase($(this))
  )

  # Antes de eliminar presponsable confirmar si se eliminan dependientes
  $('#presponsable').on('cocoon:before-remove', '', (e, papa) ->
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
      nomelempe = "actos"
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
  )

  # Tras eliminar presponsable, eliminar dependientes
  $('#presponsable').on('cocoon:after-remove', '', (e, presponsable) ->
    eliminaPendientes(root.elempe);
    root.elempe = []
  )
 
  # Antes de eliminar víctima confirmar si se eliminan dependientes
  $('#victima').on('cocoon:before-remove', '', (e, papa) ->
    # Ingresa 2 veces, evitando duplicar
    if (root.elempe && root.elempe.length>0) 
      return
    root.elempe = []
    vsel=papa.find('.caso_victima_persona_id input')
    if (vsel.length>0)
      idv = vsel.val()
      nomelempe = "actos"
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
  )

  # Tras eliminar víctima, eliminar dependientes
  $('#victima').on('cocoon:after-remove', '', (e, presponsable) ->
    eliminaPendientes(root.elempe);
    root.elempe = []
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

  
  # Envia formulario al presiones enlaces con clase fichacambia 
  $(document).on('click', 'a.fichacambia[href^="#"]', (e) ->
    f=$('form')
    a=f.attr('action')
    $.post(a, f.serialize())
    e.preventDefault() 
    return
  )
 
  return
