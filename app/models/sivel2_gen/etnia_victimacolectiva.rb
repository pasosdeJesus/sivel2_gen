# frozen_string_literal: true

require "sivel2_gen/concerns/models/etnia_victimacolectiva"

module Sivel2Gen
  # Relación n:n entre Etnia y Víctima Colectiva
  class EtniaVictimacolectiva < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::EtniaVictimacolectiva
  end
end
