require 'sivel2_gen/concerns/controllers/fuentesprensa_controller'

module Sivel2Gen
  class FuentesprensaController < Heb412Gen::ModelosController
    load_and_authorize_resource class: Sivel2Gen::CasoFuenteprensa
    include Sivel2Gen::Concerns::Controllers::FuentesprensaController
  end
end
