module Sivel2Gen
  module Admin
    class VinculosestadoController < Sip::Admin::BasicasController
      before_action :set_vinculoestado, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Vinculoestado
  
      def clase 
        "Sivel2Gen::Vinculoestado"
      end
  
      def set_vinculoestado
        @basica = Vinculoestado.find(params[:id])
      end
 
      def genclase
        return 'M';
      end
 
      def vinculoestado_params
        params.require(:vinculoestado).permit(*atributos_form)
      end
  
    end
  end
end
