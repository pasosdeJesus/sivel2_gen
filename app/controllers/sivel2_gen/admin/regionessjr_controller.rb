# encoding: UTF-8
module Sivel2Gen
  module Admin
    class RegionessjrController < BasicasController
      before_action :set_regionsjr, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource
  
      def clase 
        "regionsjr"
      end
  
      def set_regionsjr
        @basica = Regionsjr.find(params[:id])
      end
  
      def regionsjr_params
        params.require(:regionsjr).permit(*atributos_form)
      end
  
    end
  end
end
