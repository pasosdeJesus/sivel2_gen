require 'sivel2_gen/concerns/models/organizacion_victimacolectiva'

module Sivel2Gen
  class OrganizacionVictimacolectiva < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::OrganizacionVictimacolectiva
  end
end
