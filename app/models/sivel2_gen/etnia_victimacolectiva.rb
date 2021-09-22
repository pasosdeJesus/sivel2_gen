
require 'sivel2_gen/concerns/models/etnia_victimacolectiva'

module Sivel2Gen
  class EtniaVictimacolectiva < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::EtniaVictimacolectiva
  end
end
