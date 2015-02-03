# vim: set expandtab tabstop=2 shiftwidth=2 fileencoding=utf-8:
# Code to share among motors on top of sivel2_gen
# You can use CoffeeScript in this file: http://coffeescript.org/
#

# Elimina secciones agregadas con cocoon listadas en elempe
eliminaPendientes = (elempe) ->
  for i, e of elempe
    l = e.find('.remove_fields')
    _cocoon_remove_fields(l)

# Actualiza cuadro de selección con presuntos responsables
# s es un select jquery
actualiza_presponsables = (s) ->
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

# Actualiza cuadro de selección con víctimas
# s es un select jquery
actualiza_victimas = (s) ->
  sel =s.val()
  nh = ''
  c = $('#contacto')
  lcg = c.add('#victima .control-group[style!="display: none;"]')
  lcg.each((k, v) ->
    id = $(v).find('div').filter( () -> 
    this.attributes.class.value.match(/caso_victima[_0-9]*persona_id/)).find(
      'input').val()
    nh = nh + "<option value='" + id + "'"
    if id == sel 
      nh = nh + ' selected'
    # texto: nombres apellidos
    nom = $(v).find('div').filter( () -> 
      this.attributes.class.value.match(/caso_victima[_0-9]*persona_nombres/)).find('input').val()
    ap = $(v).find('div').filter( () -> 
      this.attributes.class.value.match(/caso_victima[_0-9]*persona_apellidos/)).find('input').val()
    tx = (nom + " " + ap).trim()
    nh = nh + ">" + tx + "</option>" 
  )
  s.html(nh)

  
# AUTOCOMPLETACIÓN PERSONA
# Elije una persona en autocompletación
selPersona = (label, id, id_victima, divcp) ->
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


