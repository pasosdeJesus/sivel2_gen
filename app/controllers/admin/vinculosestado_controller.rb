# encoding: UTF-8
module Admin
  class VinculosestadoController < BasicasController
    before_action :set_vinculoestado, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "vinculoestado"
    end

    def set_vinculoestado
      @basica = Vinculoestado.find(params[:id])
    end

    def vinculoestado_params
      params.require(:vinculoestado).permit(*atributos_form)
    end

  end
end
