# encoding: UTF-8
module Admin
  class EtiquetasController < BasicasController
    before_action :set_etiqueta, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "etiqueta"
    end

    def set_etiqueta
      @basica = Etiqueta.find(params[:id])
    end

    def etiqueta_params
      params.require(:etiqueta).permit(*atributos_form)
    end

  end
end
