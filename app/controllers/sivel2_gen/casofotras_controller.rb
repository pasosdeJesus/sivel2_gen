require 'date'

require 'sivel2_gen/concerns/controllers/casofotras_controller'

module Sivel2Gen
  class CasofotrasController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::CasoFotra
    include Sivel2Gen::Concerns::Controllers::CasofotrasController
  end
end
