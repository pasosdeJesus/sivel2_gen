# encoding: UTF-8
module Admin
  class MunicipiosController < BasicasController
    before_action :set_municipio, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "municipio"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_municipio
      @basica = Municipio.find(params[:id])
    end

    def atributos_index
      ["id",  "id_pais", "id_departamento", "nombre", "latitud", "longitud", 
        "fechacreacion", "fechadeshabilitacion"]
    end
    
    def atributos_form
      atributos_index
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def municipio_params
      params.require(:municipio).permit( *atributos_form)
    end

  end
end
