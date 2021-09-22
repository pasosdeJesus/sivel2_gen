module Sivel2Gen
  module Admin
    class FiliacionesController < Sip::Admin::BasicasController
      before_action :set_filiacion, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Filiacion
  
      def clase 
        "Sivel2Gen::Filiacion"
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
