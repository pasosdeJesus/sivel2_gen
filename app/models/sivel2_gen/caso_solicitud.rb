# frozen_string_literal: true

require "sivel2_gen/concerns/models/caso_solicitud"

module Sivel2Gen
  # Relación n:n entre Caso y Solicitud
  class CasoSolicitud < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::CasoSolicitud
  end
end
