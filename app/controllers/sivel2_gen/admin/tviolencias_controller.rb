# encoding: UTF-8
module Sivel2Gen
  module Admin
    class TviolenciasController < Sip::Admin::BasicasController
      before_action :set_tviolencia, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Tviolencia
  
      def clase 
        "Sivel2Gen::Tviolencia"
      end
  
      def set_tviolencia
        @basica = Tviolencia.find(params[:id])
      end
  
      def atributos_index
        ["id", 
         "nombre", 
         "nomcorto", 
         "observaciones",
         "fechacreacion_localizada", 
         "habilitado"]
      end

      def atributos_form
        atributos_index
      end

      def genclase
        return 'M';
      end
  
      def tviolencia_params
        params.require(:tviolencia).permit(*atributos_form)
      end
  
    end
  end
end
