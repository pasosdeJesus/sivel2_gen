# encoding: UTF-8
module Admin
  class EstadoscivilesController < BasicasController
    before_action :set_estadocivil, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "estadocivil"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_estadocivil
      @basica = Estadocivil.find(params[:id])
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estadocivil_params
      params.require(:estadocivil).permit(*atributos_form)
    end

  end
end
