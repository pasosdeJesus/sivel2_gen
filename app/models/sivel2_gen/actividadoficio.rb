# frozen_string_literal: true

require "sivel2_gen/concerns/models/actividadoficio"

module Sivel2Gen
  # Tabla básica Actividad u Oficio
  class Actividadoficio < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Actividadoficio
  end
end
