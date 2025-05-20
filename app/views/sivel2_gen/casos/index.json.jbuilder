# frozen_string_literal: true

json.array!(@casossjr) do |casosjr|
  json.extract!(casosjr.caso, :id, :titulo, :fecha, :hora, :duracion, :memo, :grconfiabilidad, :gresclarecimiento, :grimpunidad, :grinformacion, :bienes, :intervalo_id)
  json.url(caso_url(casosjr.caso, format: :json))
end
