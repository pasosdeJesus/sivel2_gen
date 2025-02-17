# frozen_string_literal: true

require "sivel2_gen/concerns/models/fuenteprensa"

module Msip
  class Fuenteprensa < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Fuenteprensa
  end
end
