module Sivel2Gen
  module Admin
    class TviolenciasController < Msip::Admin::BasicasController
      before_action :set_tviolencia, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Tviolencia
  
      def clase 
        "Sivel2Gen::Tviolencia"
      end
  
      def set_tviolencia
        @basica = Tviolencia.find(params[:id])
      end
  
      def atributos_index
        [:id, 
         :nombre, 
         :nomcorto, 
         :observaciones,
         :fechacreacion_localizada, 
         :habilitado]
      end

      def atributos_form # Se requiere id
        atributos_index - [:habilitado] +
         [:fechadeshabilitacion] -
         [:fechacreacion_localizada] + 
         [:fechacreacion]
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
