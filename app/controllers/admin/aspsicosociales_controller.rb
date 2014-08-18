# encoding: UTF-8
module Admin
  class AspsicosocialesController < BasicasController
    before_action :set_aspsicosocial, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "aspsicosocial"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_aspsicosocial
      @basica = Aspsicosocial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aspsicosocial_params
      params.require(:aspsicosocial).permit(*atributos_form)
    end

  end
end
