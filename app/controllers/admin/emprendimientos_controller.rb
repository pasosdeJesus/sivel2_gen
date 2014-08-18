# encoding: UTF-8
module Admin
  class EmprendimientosController < BasicasController
    before_action :set_emprendimiento, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "emprendimiento"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_emprendimiento
      @basica = Emprendimiento.find(params[:id])
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emprendimiento_params
      params.require(:emprendimiento).permit(*atributos_form)
    end

  end
end
