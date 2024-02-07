require 'sivel2_gen/concerns/controllers/actos_controller'

module Sivel2Gen
  class ActosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Acto

    include Sivel2Gen::Concerns::Controllers::ActosController

  end
end
