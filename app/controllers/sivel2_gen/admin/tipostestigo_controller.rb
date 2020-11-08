# encoding: UTF-8
module Sivel2Gen
  module Admin
    class TipostestigoController < Sip::Admin::BasicasController
      before_action :set_tipotestigo, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Sivel2Gen::Tipotestigo
  
      def clase 
        "Sivel2Gen::Tipotestigo"
      end
  
      def set_tipotestigo
        @basica = Sivel2Gen::Tipotestigo.find(params[:id])
      end
  
      def atributos_index
        [
          :id, 
          :nombre, 
          :observaciones, 
          :fechacreacion_localizada, 
          :habilitado
        ]
      end
  
      def genclase
        'M'
      end
  
      def tipotestigo_params
        params.require(:tipotestigo).permit(*atributos_form)
      end
  
    end
  end
end
