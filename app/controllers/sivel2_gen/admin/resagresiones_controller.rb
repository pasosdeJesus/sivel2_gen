# encoding: UTF-8

module Sivel2Gen
  module Admin
    class ResagresionesController < Sip::Admin::BasicasController
      before_action :set_resagresion, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Sivel2Gen::Resagresion
  
      def clase 
        "Sivel2Gen::Resagresion"
      end
  
      def set_resagresion
        @basica = Resagresion.find(params[:id])
      end
  
      def atributos_index
        [
          "id", "nombre", "observaciones", "fechacreacion", 
          "fechadeshabilitacion"
        ]
      end
  
      def genclase
        'F'
      end
  
      def resagresion_params
        params.require(:resagresion).permit(*atributos_form)
      end
  
    end
  end
end
