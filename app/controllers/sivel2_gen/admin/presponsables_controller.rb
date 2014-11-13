# encoding: UTF-8
module Sivel2Gen
  module Admin
    class PresponsablesController < BasicasController
      before_action :set_presponsable, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource
  
      def clase 
        "presponsable"
      end
  
      def set_presponsable
        @basica = Presponsable.find(params[:id])
      end
  
      def genclase
        return 'M';
      end

      def presponsable_params
        params.require(:presponsable).permit(*atributos_form)
      end
  
    end
  end
end
