require 'sivel2_gen/concerns/controllers/caso_anexos_controller'

module Sivel2Gen
  class CasoAnexosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::AnexoCaso
    include Sivel2Gen::Concerns::Controllers::CasoAnexosController
  end
end
