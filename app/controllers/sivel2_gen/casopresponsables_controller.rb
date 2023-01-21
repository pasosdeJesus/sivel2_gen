require 'date'

require 'sivel2_gen/concerns/controllers/casopresponsables_controller'

module Sivel2Gen
  class CasopresponsablesController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::CasoPresponsable
    include Sivel2Gen::Concerns::Controllers::CasopresponsablesController
  end
end
