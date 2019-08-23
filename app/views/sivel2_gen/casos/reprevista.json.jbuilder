# frozen_string_literal: true

@conscaso.each do |conscaso|
  caso= conscaso.caso
  json.partial! 'sivel2_gen/casos/basicos', caso: caso
end
