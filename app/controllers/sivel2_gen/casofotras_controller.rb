require 'date'

require 'sivel2_gen/concerns/controllers/casofotras_controller'

module Sivel2Gen
  class CasofotrasController < ApplicationController
    include Sivel2Gen::Concerns::Controllers::CasofotrasController
    load_and_authorize_resource class: Sivel2Gen::Caso
  end
end
