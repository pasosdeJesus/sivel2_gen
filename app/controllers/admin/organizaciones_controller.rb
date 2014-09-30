# encoding: UTF-8
module Admin
  class OrganizacionesController < BasicasController
    before_action :set_organizacion, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "organizacion"
    end

    def set_organizacion
      @basica = Organizacion.find(params[:id])
    end

    def organizacion_params
      params.require(:organizacion).permit(*atributos_form)
    end

  end
end
