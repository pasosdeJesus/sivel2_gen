# encoding: UTF-8
module Sivel2Gen
  module Admin
    class ClasesController < BasicasController
      before_action :set_clase, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Clase
  
      def clase 
        "Sivel2Gen::Clase"
      end
  
      def set_clase
        @basica = Clase.find(params[:id])
      end
  
      def atributos_index
        [ 
          "id", "id_pais", "id_departamento", "id_municipio", "nombre",
          "id_tclase", "latitud", "longitud", 
          "fechacreacion", "fechadeshabilitacion"
        ]
      end
  
      def atributos_form
        atributos_index
      end
  
      def genclase
        return 'M';
      end

      def clase_params
        params.require(:clase).permit(*atributos_form)
      end
  
    end
  end
end
