# encoding: UTF-8
module Sivel2Gen
  module Admin
    class SupracategoriasController < BasicasController
      before_action :set_supracategoria, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource
  
      def clase 
        "supracategoria"
      end
  
      def set_supracategoria
        @basica = Supracategoria.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "id_tviolencia", "fechacreacion", "fechadeshabilitacion"]
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
