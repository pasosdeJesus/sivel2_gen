# encoding: UTF-8
module Admin
  class EtniasController < BasicasController
    before_action :set_etnia, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "etnia"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_etnia
      @basica = Etnia.find(params[:id])
    end

    def atributos_index
      ["id", "nombre", "descripcion", "fechacreacion", "fechadeshabilitacion"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etnia_params
      params.require(:etnia).permit(*atributos_form)
    end

  end
end
