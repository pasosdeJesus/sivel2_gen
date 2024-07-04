module Sivel2Gen
  module Admin
    class IntervalosController < Msip::Admin::BasicasController
      before_action :set_intervalo, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Intervalo
  
      def clase 
        "Sivel2Gen::Intervalo"
      end
  
      def set_intervalo
        @basica = Intervalo.find(params[:id])
      end

      def genclase
        'M'
      end

      def atributos_index
        ["id",  "nombre", "rango", "observaciones",
         "fechacreacion_localizada", "habilitado"]
      end
      
      def intervalo_params
        params.require(:intervalo).permit(*atributos_form)
      end
  
    end
  end
end
