
require 'sivel2_gen/concerns/controllers/buscarrepetidos_controller'

module Sivel2Gen
  class BuscarrepetidosController < ApplicationController

    include Sivel2Gen::Concerns::Controllers::BuscarrepetidosController
    load_and_authorize_resource class: Sivel2Gen::Caso

  end
end
