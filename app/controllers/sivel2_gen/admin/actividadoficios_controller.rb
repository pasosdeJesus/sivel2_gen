# encoding: UTF-8
module Sivel2Gen
  module Admin
    class ActividadoficiosController < BasicasController
      before_action :set_actividadoficio, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource
  
      def clase 
        "actividadoficio"
      end
  
      def set_actividadoficio
        @basica = Actividadoficio.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "fechacreacion", "fechadeshabilitacion"]
      end
  
      def actividadoficio_params
        params.require(:actividadoficio).permit(*atributos_form)
      end
  
    end
  end
end
