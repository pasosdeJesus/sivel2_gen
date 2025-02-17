# frozen_string_literal: true

require "date"
require "sivel2_gen/concerns/controllers/personas_controller"

module Msip
  class PersonasController < Msip::ModelosController
    load_and_authorize_resource class: Msip::Persona
    include Sivel2Gen::Concerns::Controllers::PersonasController
  end
end
