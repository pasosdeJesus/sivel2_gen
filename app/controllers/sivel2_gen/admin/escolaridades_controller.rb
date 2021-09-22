module Sivel2Gen
  module Admin
    class EscolaridadesController < Sip::Admin::BasicasController
      before_action :set_escolaridad, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Escolaridad
  
      def clase 
        "Sivel2Gen::Escolaridad"
      end
  
      def set_escolaridad
        @basica = Escolaridad.find(params[:id])
      end
  
      def genclase
        'M'
      end
  
      def escolaridad_params
        params.require(:escolaridad).permit(*atributos_form)
      end
  
    end
  end
end
