# frozen_string_literal: true

require "sivel2_gen/concerns/models/caso"

module Sivel2Gen
  # Un caso de violencia socio política. Lo determina la fecha de ocurrencia
  # y la ubicación.
  class Caso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Caso
  end
end
