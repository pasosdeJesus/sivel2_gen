
require 'sivel2_gen/concerns/models/resagresion'

module Sivel2Gen
  # Tabla básica Resultado de Agresión (aplica a combatientes solamente)
  class Resagresion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Resagresion
  end
end
