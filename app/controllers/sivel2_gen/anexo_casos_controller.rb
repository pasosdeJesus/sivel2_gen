require 'sivel2_gen/concerns/controllers/anexo_casos_controller'

module Sivel2Gen
  class AnexoCasosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::AnexoCaso
    include Sivel2Gen::Concerns::Controllers::AnexoCasosController
  end
end
