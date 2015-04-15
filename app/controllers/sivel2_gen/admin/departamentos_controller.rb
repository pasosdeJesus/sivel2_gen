# encoding: UTF-8
module Sivel2Gen
  module Admin
    class DepartamentosController < BasicasController
      before_action :set_departamento, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Departamento
  
      def clase 
        "Sip::Departamento"
      end
  
      def set_departamento
        @basica = Departamento.find(params[:id])
      end
  
      def atributos_index
        [
          "id", "id_pais", "nombre", "latitud", "longitud", 
          "fechacreacion", "fechadeshabilitacion"
        ]
      end
  
      def atributos_form
        atributos_index
      end
  
      def genclase
        return 'M';
      end
  
      def departamento_params
        params.require(:departamento).permit(*atributos_form)
      end
  
    end
  end
end
