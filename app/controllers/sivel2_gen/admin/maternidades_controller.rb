module Sivel2Gen
  module Admin
    class MaternidadesController < Msip::Admin::BasicasController
      before_action :set_maternidad, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Maternidad

      def clase 
        "Sivel2Gen::Maternidad"
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_maternidad
        @basica = Sivel2Gen::Maternidad.find(params[:id])
      end

      def genclase
        return 'F';
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def maternidad_params
        params.require(:maternidad).permit(*atributos_form)
      end

    end
  end
end
