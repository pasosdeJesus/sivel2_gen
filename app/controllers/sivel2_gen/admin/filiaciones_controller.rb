# encoding: UTF-8
module Sivel2Gen
  module Admin
    class FiliacionesController < BasicasController
      before_action :set_filiacion, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource
  
      def clase 
        "filiacion"
      end
  
      def set_filiacion
        @basica = Filiacion.find(params[:id])
      end
  
      def filiacion_params
        params.require(:filiacion).permit(*atributos_form)
      end
  
    end
  end
end
