# encoding: UTF-8
module Admin
  class MaternidadesController < BasicasController
    before_action :set_maternidad, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "maternidad"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_maternidad
      @basica = Maternidad.find(params[:id])
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maternidad_params
      params.require(:maternidad).permit(*atributos_form)
    end

  end
end
