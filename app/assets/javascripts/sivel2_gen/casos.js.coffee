# vim: set expandtab tabstop=2 shiftwidth=2 fileencoding=utf-8:
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

#//= require sivel2_gen/libcasos


$(document).on 'ready page:load',  -> 
  root = exports ? this
  prepara_eventos_comunes(root)

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
      elimina_destruidos()
      actualiza_presponsables($('#caso_acto_id_presponsable'))
      actualiza_victimas($('#caso_acto_id_persona'))
      root.tfichacambia = Date.now()
    return
  )

  return
