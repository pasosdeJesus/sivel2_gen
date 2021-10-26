require 'sivel2_gen/concerns/controllers/casos_controller'

module Sivel2Gen
  class CasosController < Heb412Gen::ModelosController 

    before_action :set_caso, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sivel2Gen::Caso, 
      except: [:index, :show, :mapaosm, :update]

    include Sivel2Gen::Concerns::Controllers::CasosController

  end
end
