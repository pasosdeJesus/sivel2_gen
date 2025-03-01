# frozen_string_literal: true

module Sivel2Gen
  module Admin
    class SupracategoriasController < Msip::Admin::BasicasController
      before_action :set_supracategoria, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Supracategoria

      def clase
        "Sivel2Gen::Supracategoria"
      end

      def set_supracategoria
        @basica = Supracategoria.find(params[:id])
      end

      def atributos_index
        [
          :id,
          :nombre,
          :tviolencia_id,
          :codigo,
          :observaciones,
          :fechacreacion_localizada,
          :habilitado,
        ]
      end

      def atributos_form # Requiere id
        atributos_index - [:habilitado] +
          [:fechadeshabilitacion] -
          [:fechacreacion_localizada] +
          [:fechacreacion]
      end

      def supracategoria_params
        params.require(:supracategoria).permit(*atributos_form)
      end
    end
  end
end
