# encoding: UTF-8

require 'sivel2_gen/concerns/controllers/lugarespreliminares_controller'

module Sivel2Gen
  class LugarespreliminaresController < Sip::ModelosController 

    include Sivel2Gen::Concerns::Controllers::LugarespreliminaresController
    before_action :set_lugarpreliminar,
        only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sivel2Gen::Lugarpreliminar,
      except: [:index, :show, :update]
  end
end
