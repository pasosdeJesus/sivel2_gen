
require 'sivel2_gen/concerns/models/contextovictima'

module Sivel2Gen
  # Tabla básica Contexto de una víctima
  class Contextovictima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Contextovictima
  end
end
