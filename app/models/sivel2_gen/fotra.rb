# frozen_string_literal: true

require "sivel2_gen/concerns/models/fotra"

module Sivel2Gen
  # Fuente no frecuente que se relaciona con un caso
  class Fotra < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Fotra
  end
end
