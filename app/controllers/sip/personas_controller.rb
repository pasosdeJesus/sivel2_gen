require 'date'
require 'sivel2_gen/concerns/controllers/personas_controller' 

module Sip
  class PersonasController < Sip::ModelosController

    load_and_authorize_resource class: Sip::Persona
    include Sivel2Gen::Concerns::Controllers::PersonasController
  end
end
