# encoding: UTF-8
module Admin
  class EscolaridadesController < BasicasController
    before_action :set_escolaridad, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "escolaridad"
    end

    def set_escolaridad
      @basica = Escolaridad.find(params[:id])
    end

		def genclase
			'M'
		end

    def escolaridad_params
      params.require(:escolaridad).permit(*atributos_form)
    end

  end
end
