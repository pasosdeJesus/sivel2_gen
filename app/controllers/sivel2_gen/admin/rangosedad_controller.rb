module Sivel2Gen
  module Admin
    class RangosedadController < Msip::Admin::BasicasController
      before_action :set_rangoedad, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Rangoedad
  
      def clase 
        "Sivel2Gen::Rangoedad"
      end
  
      def set_rangoedad
        @basica = Rangoedad.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "limiteinferior", "limitesuperior", 
          "observaciones", "fechacreacion_localizada", "habilitado"]
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
