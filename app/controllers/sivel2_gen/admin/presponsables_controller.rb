require 'sivel2_gen/concerns/controllers/presponsables_controller'

module Sivel2Gen
  module Admin
    class PresponsablesController < Sip::Admin::BasicasController
      before_action :set_presponsable, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Presponsable

      include Sivel2Gen::Concerns::Controllers::PresponsablesController

    end
  end
end
