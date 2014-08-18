json.array!(@casos) do |caso|
  json.extract! caso, :id, :titulo, :fecha, :hora, :duracion, :memo, :grconfiabilidad, :gresclarecimiento, :grimpunidad, :grinformacion, :bienes, :id_intervalo
  json.url caso_url(caso, format: :json)
end
