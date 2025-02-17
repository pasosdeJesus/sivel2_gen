# frozen_string_literal: true

require "date"

require "sivel2_gen/concerns/controllers/combatientes_controller"

module Sivel2Gen
  class CombatientesController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Combatiente
    include Sivel2Gen::Concerns::Controllers::CombatientesController
  end
end
