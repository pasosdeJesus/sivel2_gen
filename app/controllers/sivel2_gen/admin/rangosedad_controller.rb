# encoding: UTF-8
module Sivel2Gen
  module Admin
    class RangosedadController < Sip::Admin::BasicasController
      before_action :set_rangoedad, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Rangoedad
  
      def clase 
        "Sivel2Gen::Rangoedad"
      end
  
      def set_rangoedad
        @basica = Rangoedad.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "rango", "limiteinferior", "limitesuperior", 
          "observaciones", "fechacreacion", "fechadeshabilitacion"]
      end

      def genclase
        return 'M';
      end
  
      def rangoedad_params
        params.require(:rangoedad).permit(*atributos_form)
      end
  
    end
  end
end
