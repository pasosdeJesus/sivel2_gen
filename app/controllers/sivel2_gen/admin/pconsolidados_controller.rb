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
        ["id", 
         "nombre", 
         "tipoviolencia", 
         "clasificacion", 
         "peso", 
         "observaciones", 
         "categoria_ids",
         "fechacreacion_localizada", 
         "habilitado"
        ]
      end

      # Campos que se presentar en formulario
      def atributos_form
        atributos_show - 
          ["id", :id, 'created_at', :created_at, 'updated_at', :updated_at,
           'categoria_ids', :categoria_ids] +
          [ 'categoria_ids' => [] ]
      end

      def index_reordenar(c)
        c.reorder(:id)
      end

      def pconsolidado_params
        params.require(:pconsolidado).permit(*atributos_form)
      end

    end
  end
end
