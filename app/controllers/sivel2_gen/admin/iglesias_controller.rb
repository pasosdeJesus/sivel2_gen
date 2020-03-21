# encoding: UTF-8
module Sivel2Gen
  module Admin
    class IglesiasController < Sip::Admin::BasicasController
      before_action :set_iglesia, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Iglesia
  
      def clase 
        "Sivel2Gen::Iglesia"
      end

      def registrar_en_bitacora
        true
      end

      def set_iglesia
        @basica = Iglesia.find(params[:id])
      end
  
      def iglesia_params
        params.require(:iglesia).permit(*atributos_form)
      end
  
    end
  end
end
