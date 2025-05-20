# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/victimascolectivas_controller"

module Sivel2Gen
  class VictimascolectivasController < Heb412Gen::ModelosController
    load_and_authorize_resource class: Sivel2Gen::Victimacolectiva

    include Sivel2Gen::Concerns::Controllers::VictimascolectivasController
  end
end
