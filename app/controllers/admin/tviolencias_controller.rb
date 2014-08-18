# encoding: UTF-8
module Admin
  class TviolenciasController < BasicasController
    before_action :set_tviolencia, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "tviolencia"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tviolencia
      @basica = Tviolencia.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "nomcorto", "fechacreacion", "fechadeshabilitacion"]
    end
    
    def atributos_form
      atributos_index
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tviolencia_params
      params.require(:tviolencia).permit(*atributos_form)
    end

  end
end
