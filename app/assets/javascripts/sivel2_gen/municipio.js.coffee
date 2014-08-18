
#//= require sivel2_gen/geo

$(document).on 'ready page:load',  -> 
  # Al cambiar país se recalcula lista de departamentos
  $(document).on('change', 'select[id=municipio_id_pais]', (e) ->
    llenaDepartamento($(this))
  )
  return
