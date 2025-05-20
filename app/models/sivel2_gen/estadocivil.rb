# frozen_string_literal: true

require "sivel2_gen/concerns/models/estadocivil"

module Sivel2Gen
  # Tabla básica Estado Civil
  class Estadocivil < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Estadocivil
  end
end
