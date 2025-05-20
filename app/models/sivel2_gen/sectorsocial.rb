# frozen_string_literal: true

require "sivel2_gen/concerns/models/sectorsocial"

module Sivel2Gen
  # Tabla básica Sector social
  class Sectorsocial < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Sectorsocial
  end
end
