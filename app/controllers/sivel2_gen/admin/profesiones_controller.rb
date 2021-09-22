module Sivel2Gen
  module Admin
    class ProfesionesController < Sip::Admin::BasicasController
      before_action :set_profesion, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Profesion
  
      def clase 
        "Sivel2Gen::Profesion"
      end
  
      def set_profesion
        @basica = Profesion.find(params[:id])
      end
  
      def profesion_params
        params.require(:profesion).permit(*atributos_form)
      end
  
    end
  end
end
