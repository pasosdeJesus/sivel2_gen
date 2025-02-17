# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/mapamun_controller"

module Sivel2Gen
  class MapamunController < ApplicationController
    # Especial, cada función debe tener autorización
    include Sivel2Gen::Concerns::Controllers::MapamunController
  end
end
