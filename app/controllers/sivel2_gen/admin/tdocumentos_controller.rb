# encoding: UTF-8
module Sivel2Gen
  module Admin
    class TdocumentosController < BasicasController
      before_action :set_tdocumento, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Tdocumento
  
      def clase 
        "Sivel2Gen::Tdocumento"
      end
  
      def set_tdocumento
        @basica = Tdocumento.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "formatoregex", "fechacreacion", "fechadeshabilitacion"]
      end
  
      def tdocumento_params
        params.require(:tdocumento).permit( *(atributos_index - ["id"]))
      end
  
    end
  end
end
