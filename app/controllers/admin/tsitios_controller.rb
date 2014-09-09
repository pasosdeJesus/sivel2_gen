# encoding: UTF-8
module Admin
  class TsitiosController < BasicasController
    before_action :set_tsitio, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "tsitio"
    end

    def set_tsitio
      @basica = Tsitio.find(params[:id])
    end

		def genclase
			return 'M';
		end

    def tsitio_params
      params.require(:tsitio).permit(*atributos_form)
    end

  end
end
