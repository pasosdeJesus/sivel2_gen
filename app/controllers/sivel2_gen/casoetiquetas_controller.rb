require 'sivel2_gen/concerns/controllers/casoetiquetas_controller'

module Sivel2Gen
  class CasoetiquetasController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Caso

    include Sivel2Gen::Concerns::Controllers::CasoetiquetasController
  end
end
