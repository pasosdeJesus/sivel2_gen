# encoding: UTF-8
module Admin
  class PconsolidadosController < BasicasController
    before_action :set_pconsolidado, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "pconsolidado"
    end

    def set_pconsolidado
      @basica = Pconsolidado.find(params[:id])
    end

    def atributos_index
      ["id", "rotulo", "tipoviolencia", "clasificacion", "peso", 
        "fechacreacion", "fechadeshabilitacion"]
    end

    def pconsolidado_params
      params.require(:pconsolidado).permit(*atributos_form)
    end

    def camponombre
      :rotulo
    end
  end
end
