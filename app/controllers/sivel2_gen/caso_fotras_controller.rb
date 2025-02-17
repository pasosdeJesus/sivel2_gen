# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/caso_fotras_controller"

module Sivel2Gen
  class CasoFotrasController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::CasoFotra
    include Sivel2Gen::Concerns::Controllers::CasoFotrasController
  end
end
