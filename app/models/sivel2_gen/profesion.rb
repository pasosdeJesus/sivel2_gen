
require 'sivel2_gen/concerns/models/profesion'

module Sivel2Gen
  # Tabla básica Profesión
  class Profesion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Profesion
  end
end
