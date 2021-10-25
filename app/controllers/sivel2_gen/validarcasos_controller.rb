
require 'sivel2_gen/concerns/controllers/validarcasos_controller'

module Sivel2Gen
  class ValidarcasosController < ApplicationController

    include Sivel2Gen::Concerns::Controllers::ValidarcasosController
    load_and_authorize_resource class: Sivel2Gen::Caso

  end
end
