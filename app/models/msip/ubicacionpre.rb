# frozen_string_literal: true

require "sivel2_gen/concerns/models/ubicacionpre"

module Msip
  class Ubicacionpre < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Ubicacionpre
  end
end
