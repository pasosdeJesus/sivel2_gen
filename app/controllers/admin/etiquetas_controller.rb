# encoding: UTF-8
module Admin
  class EtiquetasController < BasicasController
    before_action :set_etiqueta, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "etiqueta"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_etiqueta
      @basica = Etiqueta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etiqueta_params
      params.require(:etiqueta).permit(*atributos_form)
    end

  end
end
