# encoding: UTF-8
module Admin
  class RegionessjrController < BasicasController
    before_action :set_regionsjr, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "regionsjr"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_regionsjr
      @basica = Regionsjr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regionsjr_params
      params.require(:regionsjr).permit(*atributos_form)
    end

  end
end
