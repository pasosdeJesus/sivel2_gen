# encoding: UTF-8
module Admin
  class ProteccionesController < BasicasController
    before_action :set_proteccion, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "proteccion"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_proteccion
      @basica = Proteccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proteccion_params
      params.require(:proteccion).permit(*atributos_form)
    end

  end
end
