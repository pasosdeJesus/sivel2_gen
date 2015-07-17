# encoding: UTF-8
module Sivel2Gen
  module Admin
    class ActividadoficiosController < Sip::Admin::BasicasController
      before_action :set_actividadoficio, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Actividadoficio
  
      def clase 
        "Sivel2Gen::Actividadoficio"
      end
  
      def set_actividadoficio
        @basica = Actividadoficio.find(params[:id])
      end
  
      def actividadoficio_params
        params.require(:actividadoficio).permit(*atributos_form)
      end
  
    end
  end
end
