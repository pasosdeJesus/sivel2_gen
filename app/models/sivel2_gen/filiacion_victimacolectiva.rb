require 'sivel2_gen/concerns/models/filiacion_victimacolectiva'

module Sivel2Gen
  class FiliacionVictimacolectiva < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::FiliacionVictimacolectiva
  end
end
