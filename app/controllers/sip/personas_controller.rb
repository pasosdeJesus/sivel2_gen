require 'date'
require 'sivel2_gen/concerns/controllers/personas_controller' 

module Sip
  class PersonasController < Sip::ModelosController
    include Sivel2Gen::Concerns::Controllers::PersonasController
    load_and_authorize_resource class: Sip::Persona
   
  end
end
