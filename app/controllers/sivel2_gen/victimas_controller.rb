
require 'sivel2_gen/concerns/controllers/victimas_controller'

module Sivel2Gen
  class VictimasController < Heb412Gen::ModelosController
    include Sivel2Gen::Concerns::Controllers::VictimasController
    load_and_authorize_resource class: Sivel2Gen::Victima
end
