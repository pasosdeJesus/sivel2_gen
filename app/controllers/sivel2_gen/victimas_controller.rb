require 'sivel2_gen/concerns/controllers/victimas_controller'

module Sivel2Gen
  class VictimasController < Heb412Gen::ModelosController
    load_and_authorize_resource class: Sivel2Gen::Caso
    load_and_authorize_resource class: Sivel2Gen::Victima
    include Sivel2Gen::Concerns::Controllers::VictimasController
  end
end
