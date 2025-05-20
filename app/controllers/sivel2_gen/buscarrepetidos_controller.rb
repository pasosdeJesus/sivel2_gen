# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/buscarrepetidos_controller"

module Sivel2Gen
  class BuscarrepetidosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Caso
    include Sivel2Gen::Concerns::Controllers::BuscarrepetidosController
  end
end
