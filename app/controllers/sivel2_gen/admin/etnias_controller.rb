module Sivel2Gen
  module Admin
    class EtniasController < Msip::Admin::BasicasController
      before_action :set_etnia, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Etnia
  
      def clase 
        "Sivel2Gen::Etnia"
      end
  
      def set_etnia
        @basica = Etnia.find(params[:id])
      end
  
      def atributos_index
        ["id", "nombre", "descripcion", "observaciones",
         "fechacreacion_localizada", "habilitado"]
      end
  
      def etnia_params
        params.require(:etnia).permit(*atributos_form)
      end
  
    end
  end
end
