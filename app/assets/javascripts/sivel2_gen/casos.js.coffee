# vim: set expandtab tabstop=2 shiftwidth=2 fileencoding=utf-8:
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

#//= require cocoon
#//= require sivel2_gen/geo
#//= require sivel2_gen/libcasos


$(document).on 'ready page:load',  -> 
  root = exports ? this
  prepara_eventos_comunes(root)
  return
