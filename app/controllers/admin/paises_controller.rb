# encoding: UTF-8
module Admin
  class PaisesController < BasicasController
    before_action :set_pais, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "pais"
    end

    def set_pais
      @basica = Pais.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "nombreiso", "latitud", "longitud", "alfa2", 
        "alfa3", "codiso", "div1", "div2", "div3", 
        "fechacreacion", "fechadeshabilitacion"]
    end
   
    def atributos_form
      atributos_index
    end

		def genclase
			return 'M';
		end

    def pais_params
      params.require(:pais).permit(*atributos_form)
    end

  end
end
