# encoding: UTF-8
module Sivel2Gen
  module Admin
    class OrganizacionesController < Sip::Admin::BasicasController
      before_action :set_organizacion, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Organizacion
  
      def clase 
        "Sivel2Gen::Organizacion"
      end
  
      def set_organizacion
        @basica = Organizacion.find(params[:id])
      end
  
      def organizacion_params
        params.require(:organizacion).permit(*atributos_form)
      end
  
    end
  end
end
