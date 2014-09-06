# encoding: UTF-8
module Admin
  class FronterasController < BasicasController
    before_action :set_frontera, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "frontera"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_frontera
      @basica = Frontera.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "fechacreacion", "fechadeshabilitacion"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frontera_params
      params.require(:frontera).permit(*atributos_form)
    end

  end
end
