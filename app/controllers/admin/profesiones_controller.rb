# encoding: UTF-8
module Admin
  class ProfesionesController < BasicasController
    before_action :set_profesion, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "profesion"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_profesion
      @basica = Profesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profesion_params
      params.require(:profesion).permit(*atributos_form)
    end

  end
end
