# encoding: UTF-8
module Sivel2Gen
  module Admin
    class TviolenciasController < BasicasController
      before_action :set_tviolencia, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource
  
      def clase 
        "tviolencia"
      end
  
      def set_tviolencia
        @basica = Tviolencia.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "nomcorto", "fechacreacion", "fechadeshabilitacion"]
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
