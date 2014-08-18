# encoding: UTF-8
module Admin
  class AslegalesController < BasicasController
    before_action :set_aslegal, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "aslegal"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_aslegal
      @basica = Aslegal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aslegal_params
      params.require(:aslegal).permit(*atributos_form)
    end

  end
end
