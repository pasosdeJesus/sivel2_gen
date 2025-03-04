# frozen_string_literal: true

module Sivel2Gen
  module Admin
    class ContextosController < Msip::Admin::BasicasController
      before_action :set_contexto, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Contexto

      def clase
        "Sivel2Gen::Contexto"
      end

      def set_contexto
        @basica = Contexto.find(params[:id])
      end

      def genclase
        "M"
      end

      def contexto_params
        params.require(:contexto).permit(*atributos_form)
      end
    end
  end
end
