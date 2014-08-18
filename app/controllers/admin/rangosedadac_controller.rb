# encoding: UTF-8
module Admin
  class RangosedadacController < BasicasController
    before_action :set_rangoedadac, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "rangoedadac"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rangoedadac
      @basica = Rangoedadac.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "limiteinferior", "limitesuperior", 
        "fechacreacion", "fechadeshabilitacion"]
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rangoedadac_params
      params.require(:rangoedadac).permit(*atributos_form)
    end

  end
end
