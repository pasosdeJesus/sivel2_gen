require 'sivel2_gen/concerns/controllers/actoscolectivos_controller'

module Sivel2Gen
  class ActoscolectivosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Actocolectivo
    include Sivel2Gen::Concerns::Controllers::ActoscolectivosController

  end
end
