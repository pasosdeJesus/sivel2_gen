# encoding: UTF-8
module Admin
  class ComosuposController < BasicasController
    before_action :set_comosupo, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "comosupo"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comosupo
      @basica = Comosupo.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "fechacreacion", "fechadeshabilitacion"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comosupo_params
      params.require(:comosupo).permit( *(atributos_index - ["id"]))
    end

    helper_method :clase, :atributos_index
  end
end
