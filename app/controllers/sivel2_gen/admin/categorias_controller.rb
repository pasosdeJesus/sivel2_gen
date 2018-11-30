# encoding: UTF-8
module Sivel2Gen
  module Admin
    class CategoriasController < Sip::Admin::BasicasController
      before_action :set_categoria, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Categoria

      def clase 
        "Sivel2Gen::Categoria"
      end
  
      def set_categoria
        @basica = Categoria.find(params[:id])
      end
  
      def atributos_index
        [
          :id, 
          :nombre, 
          :supracategoria_id,
          :contadaen, 
          :tipocat, 
          :id_pconsolidado, 
          :observaciones, 
          :fechacreacion_localizada, 
          :habilitado
        ]
      end
  
      def atributos_form
        atributos_show
      end
  
      def categoria_params
        params.require(:categoria).permit(*atributos_form)
      end
  
    end
  end
end
