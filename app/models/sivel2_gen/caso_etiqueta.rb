# frozen_string_literal: true

require "sivel2_gen/concerns/models/caso_etiqueta"

module Sivel2Gen
  # Relación n:n entre Caso y Etiqueta
  class CasoEtiqueta < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::CasoEtiqueta
  end
end
