require 'sivel2_gen/concerns/controllers/caso_etiquetas_controller'

module Sivel2Gen
  class CasoEtiquetasController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Caso

    include Sivel2Gen::Concerns::Controllers::CasoEtiquetasController
  end
end
