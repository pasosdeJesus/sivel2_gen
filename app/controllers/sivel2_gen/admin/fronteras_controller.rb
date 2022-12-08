module Sivel2Gen
  module Admin
    class FronterasController < Msip::Admin::BasicasController
      before_action :set_frontera, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Frontera
  
      def clase 
        "Sivel2Gen::Frontera"
      end
  
      def set_frontera
        @basica = Frontera.find(params[:id])
      end
  
      def frontera_params
        params.require(:frontera).permit(*atributos_form)
      end
  
    end
  end
end
