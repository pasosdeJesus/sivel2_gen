# encoding: UTF-8
module Admin
  class EscolaridadesController < BasicasController
    before_action :set_escolaridad, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "escolaridad"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_escolaridad
      @basica = Escolaridad.find(params[:id])
    end

		def genclase
			'M'
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escolaridad_params
      params.require(:escolaridad).permit(*atributos_form)
    end

  end
end
