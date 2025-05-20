# frozen_string_literal: true

require "sivel2_gen/concerns/models/region"

module Sivel2Gen
  # Tabla básica Región
  class Region < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Region
  end
end
