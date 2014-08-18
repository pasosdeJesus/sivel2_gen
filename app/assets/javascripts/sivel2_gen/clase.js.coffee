
#//= require sivel2_gen/geo

$(document).on 'ready page:load',  -> 
  # Al cambiar país se recalcula lista de departamentos
  $(document).on('change', 'select[id=clase_id_pais]', (e) ->
    llenaDepartamento($(this))
  )
  # Al cambiar departamento se recalcula lista de municipios
  $(document).on('change', 'select[id=clase_id_departamento]', (e) ->
    llenaMunicipio($(this))
  )
  return


