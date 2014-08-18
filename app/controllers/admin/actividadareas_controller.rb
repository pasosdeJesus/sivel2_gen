# encoding: UTF-8
module Admin
  class ActividadareasController < BasicasController
    before_action :set_actividadarea, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "actividadarea"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_actividadarea
      @basica = Actividadarea.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "observaciones", "fechacreacion", "fechadeshabilitacion"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividadarea_params
      params.require(:actividadarea).permit(*atributos_form)
    end
  end
end
