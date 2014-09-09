# encoding: UTF-8
module Admin
  class ProfesionesController < BasicasController
    before_action :set_profesion, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "profesion"
    end

    def set_profesion
      @basica = Profesion.find(params[:id])
    end

    def profesion_params
      params.require(:profesion).permit(*atributos_form)
    end

  end
end
