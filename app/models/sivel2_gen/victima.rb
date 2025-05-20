# frozen_string_literal: true

require "sivel2_gen/concerns/models/victima"

module Sivel2Gen
  # Victima de un caso.  Relaciona una persona con un caso.  La misma persona
  # podría estar en varios casos.
  class Victima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Victima
  end
end
