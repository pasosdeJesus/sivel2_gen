# encoding: UTF-8

module Sivel2Gen
  module Admin
    class AntecedentesController < Sip::Admin::BasicasController
      before_action :set_antecedente, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Antecedente
  
      def clase 
        "Sivel2Gen::Antecedente"
      end
  
      def set_antecedente
        @basica = Antecedente.find(params[:id])
      end
 
      def genclase
        return 'M';
      end
 
      def antecedente_params
        params.require(:antecedente).permit(*atributos_form)
      end
  
    end
  end
end
