# encoding: UTF-8
module Admin
  class RegionesController < BasicasController
    before_action :set_region, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "region"
    end

    def set_region
      @basica = Region.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "fechacreacion", "fechadeshabilitacion"]
    end

    def region_params
      params.require(:region).permit(*atributos_form)
    end

  end
end
