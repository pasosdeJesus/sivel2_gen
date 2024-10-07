require 'sivel2_gen/concerns/models/organizacion_victimacolectiva'

module Sivel2Gen
  # Relación n:n entre Organización y Victima Colectiva
  class OrganizacionVictimacolectiva < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::OrganizacionVictimacolectiva
  end
end
