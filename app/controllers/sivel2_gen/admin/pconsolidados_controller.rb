require 'sivel2_gen/concerns/controllers/pconsolidados_controller'

module Sivel2Gen
  module Admin
    class PconsolidadosController < Msip::Admin::BasicasController
      before_action :set_pconsolidado, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Pconsolidado

      include Sivel2Gen::Concerns::Controllers::PconsolidadosController

    end
  end
end
