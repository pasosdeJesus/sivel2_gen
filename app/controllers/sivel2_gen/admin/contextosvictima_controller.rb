# frozen_string_literal: true

module Sivel2Gen
  module Admin
    class ContextosvictimaController < Msip::Admin::BasicasController
      before_action :set_contextovictima, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Contextovictima

      def clase
        "Sivel2Gen::Contextovictima"
      end

      def set_contextovictima
        @basica = Contextovictima.find(params[:id])
      end

      def atributos_index
        [
          "id",
          "nombre",
          "observaciones",
          "fechacreacion_localizada",
          "habilitado",
        ]
      end

      def genclase
        "M"
      end

      def contextovictima_params
        params.require(:contextovictima).permit(*atributos_form)
      end
    end
  end
end
