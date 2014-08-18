# encoding: UTF-8
module Admin
  class RangosedadController < BasicasController
    before_action :set_rangoedad, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "rangoedad"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rangoedad
      @basica = Rangoedad.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "rango", "limiteinferior", "limitesuperior", 
        "fechacreacion", "fechadeshabilitacion"]
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rangoedad_params
      params.require(:rangoedad).permit(*atributos_form)
    end

  end
end
