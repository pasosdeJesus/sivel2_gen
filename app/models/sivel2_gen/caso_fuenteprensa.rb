
require 'sivel2_gen/concerns/models/caso_fuenteprensa'

module Sivel2Gen
  # Relación n:n entre Caso y Fuente frecuente
  class CasoFuenteprensa < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::CasoFuenteprensa
  end
end
