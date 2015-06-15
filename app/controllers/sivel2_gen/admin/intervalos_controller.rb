# encoding: UTF-8
module Sivel2Gen
  module Admin
    class IntervalosController < Sip::Admin::BasicasController
      before_action :set_intervalo, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Intervalo
  
      def clase 
        "Sivel2Gen::Intervalo"
      end
  
      def set_intervalo
        @basica = Intervalo.find(params[:id])
      end

      def gen_clase
        'M'
      end

      def atributos_index
        ["id",  "nombre", "rango", "observaciones",
         "fechacreacion", "fechadeshabilitacion"]
      end
      
      def intervalo_params
        params.require(:intervalo).permit(*atributos_form)
      end
  
    end
  end
end
