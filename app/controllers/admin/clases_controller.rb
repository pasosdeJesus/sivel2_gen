# encoding: UTF-8
module Admin
  class ClasesController < BasicasController
    before_action :set_clase, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "clase"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_clase
      @basica = Clase.find(params[:id])
    end

    def atributos_index
      ["id", "id_pais", "id_departamento", "id_municipio", "nombre",
        "id_tclase", "latitud", "longitud", 
        "fechacreacion", "fechadeshabilitacion"]
    end

    def atributos_form
      atributos_index
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clase_params
      params.require(:clase).permit(*atributos_form)
    end

  end
end
