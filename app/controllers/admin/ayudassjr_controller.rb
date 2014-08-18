# encoding: UTF-8
module Admin
  class AyudassjrController < BasicasController
    before_action :set_ayudasjr, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "ayudasjr"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_ayudasjr
      @basica = Ayudasjr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ayudasjr_params
      params.require(:ayudasjr).permit(*atributos_form)
    end

  end
end
