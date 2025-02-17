# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/mapadep_controller"

module Sivel2Gen
  class MapadepController < ApplicationController
    # Especial, cada función debe tener autorización
    include Sivel2Gen::Concerns::Controllers::MapadepController
  end
end
