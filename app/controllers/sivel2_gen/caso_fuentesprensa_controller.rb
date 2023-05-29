require 'sivel2_gen/concerns/controllers/caso_fuentesprensa_controller'

module Sivel2Gen
  class CasoFuentesprensaController < Heb412Gen::ModelosController
    load_and_authorize_resource class: Sivel2Gen::CasoFuenteprensa
    include Sivel2Gen::Concerns::Controllers::CasoFuentesprensaController
  end
end
