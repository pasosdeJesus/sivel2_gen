# encoding: UTF-8
module Admin
  class IglesiasController < BasicasController
    before_action :set_iglesia, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "iglesia"
    end

    def set_iglesia
      @basica = Iglesia.find(params[:id])
    end

    def iglesia_params
      params.require(:iglesia).permit(*atributos_form)
    end

  end
end
