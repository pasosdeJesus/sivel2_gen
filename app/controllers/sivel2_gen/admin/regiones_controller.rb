# encoding: UTF-8
module Sivel2Gen
  module Admin
    class RegionesController < Sip::Admin::BasicasController
      before_action :set_region, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Region
  
      def clase 
        "Sivel2Gen::Region"
      end
  
      def set_region
        @basica = Region.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "fechacreacion", "fechadeshabilitacion"]
      end
  
      def region_params
        params.require(:region).permit(*atributos_form)
      end
  
    end
  end
end
