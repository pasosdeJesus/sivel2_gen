# encoding: UTF-8
module Admin
  class TsitiosController < BasicasController
    before_action :set_tsitio, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "tsitio"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tsitio
      @basica = Tsitio.find(params[:id])
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tsitio_params
      params.require(:tsitio).permit(*atributos_form)
    end

  end
end
