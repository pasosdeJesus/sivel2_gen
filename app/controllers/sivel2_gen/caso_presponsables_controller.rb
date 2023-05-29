require 'date'

require 'sivel2_gen/concerns/controllers/caso_presponsables_controller'

module Sivel2Gen
  class CasoPresponsablesController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::CasoPresponsable
    include Sivel2Gen::Concerns::Controllers::CasoPresponsablesController
  end
end
