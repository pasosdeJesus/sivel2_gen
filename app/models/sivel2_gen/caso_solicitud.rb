require 'sivel2_gen/concerns/models/caso_solicitud'

module Sivel2Gen
  class CasoSolicitud < ActiveRecord::Base

    include Sivel2Gen::Concerns::Models::CasoSolicitud

  end
end
