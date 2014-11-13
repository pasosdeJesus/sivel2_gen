# encoding: UTF-8
module Sivel2Gen
  module Admin
    class RegimenessaludController < BasicasController
      before_action :set_regimensalud, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource
  
      def clase 
        "regimensalud"
      end
  
      def set_regimensalud
        @basica = Regimensalud.find(params[:id])
      end
  
      def regimensalud_params
        params.require(:regimensalud).permit(*atributos_form)
      end
  
    end
  end
end
