# frozen_string_literal: true

require "sivel2_gen/concerns/controllers/anexos_controller"

module Msip
  class AnexosController < Msip::ModelosController
    load_and_authorize_resource class: Msip::Anexo
    include Sivel2Gen::Concerns::Controllers::AnexosController
  end
end
