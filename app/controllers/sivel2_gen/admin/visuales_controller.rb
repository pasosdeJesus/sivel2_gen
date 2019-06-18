# encoding: UTF-8

module Sivel2Gen
  module Admin
    class VisualesController < Sip::Admin::BasicasController
      before_action :set_visual, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Sivel2Gen::Visual

      def clase 
        "Sivel2Gen::Visual"
      end

      def set_visual
        @basica = Sivel2Gen::Visual.find(params[:id])
      end

      def atributos_index
        [
          :id, 
          :nombre, 
          :r_nav_ini,
          :observaciones, 
          :fechacreacion_localizada, 
          :habilitado
        ]
      end

      def genclase
        'M'
      end

      def visual_params
        params.require(:visual).permit(*atributos_form)
      end

    end
  end
end
