# encoding: UTF-8
module Admin
  class RolesfamiliaController < BasicasController
    before_action :set_rolfamilia, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "rolfamilia"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rolfamilia
      @basica = Rolfamilia.find(params[:id])
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rolfamilia_params
      params.require(:rolfamilia).permit(*atributos_form)
    end

  end
end
