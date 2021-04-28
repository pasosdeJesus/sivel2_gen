# encoding: UTF-8
module Sivel2Gen
  module Admin
    class PresponsablesController < Sip::Admin::BasicasController
      before_action :set_presponsable, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Presponsable
  
      def clase 
        "Sivel2Gen::Presponsable"
      end

      def atributos_index
        [
          :id, 
          :nombre,
          :papa,
          :observaciones,
          :fechacreacion_localizada,
          :habilitado
        ]
      end

      def set_presponsable
        @basica = Presponsable.find(params[:id])
      end
  
      def genclase
        return 'M';
      end

      def lista_params
        atributos_form - [:papa] + [:papa_id]
      end

      def presponsable_params
        params.require(:presponsable).permit(*lista_params)
      end
  
    end
  end
end
