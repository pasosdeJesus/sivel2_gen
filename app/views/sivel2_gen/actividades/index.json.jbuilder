json.array!(@actividades) do |actividad|
  json.extract! actividad, :numero, :minutos, :nombre, :objetivo, :proyecto, :resultado, :fecha, :actividad, :observaciones
  json.url actividad_url(actividad, format: :json)
end
