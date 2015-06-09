# encoding: UTF-8
module Sivel2Gen
  module Admin
    class SupracategoriasController < Sip::Admin::BasicasController
      before_action :set_supracategoria, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Supracategoria
  
      def clase 
        "Sivel2Gen::Supracategoria"
      end
  
      def set_supracategoria
        @basica = Supracategoria.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "id_tviolencia", "codigo", 
         "fechacreacion", "fechadeshabilitacion"]
      end
  
      def atributos_form
        atributos_index
      end
  
      def supracategoria_params
        params.require(:supracategoria).permit( *atributos_form)
      end
  
    end
  end
end
