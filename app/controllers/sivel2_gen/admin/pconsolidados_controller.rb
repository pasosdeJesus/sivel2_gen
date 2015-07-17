# encoding: UTF-8
module Sivel2Gen
  module Admin
    class PconsolidadosController < Sip::Admin::BasicasController
      before_action :set_pconsolidado, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Pconsolidado

      def clase 
        "Sivel2Gen::Pconsolidado"
      end

      def set_pconsolidado
        @basica = Pconsolidado.find(params[:id])
      end

      def atributos_index
        ["id", "rotulo", "tipoviolencia", "clasificacion", "peso", 
         "observaciones", "fechacreacion", "fechadeshabilitacion"]
      end

      def pconsolidado_params
        params.require(:pconsolidado).permit(*atributos_form)
      end

      def camponombre
        :rotulo
      end
    end
  end
end
