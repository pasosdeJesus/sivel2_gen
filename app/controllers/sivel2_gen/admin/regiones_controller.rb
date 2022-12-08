require 'sivel2_gen/concerns/controllers/regiones_controller'

module Sivel2Gen
  module Admin
    class RegionesController < Msip::Admin::BasicasController

      before_action :set_region, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Region

      include Sivel2Gen::Concerns::Controllers::RegionesController

    end
  end
end
