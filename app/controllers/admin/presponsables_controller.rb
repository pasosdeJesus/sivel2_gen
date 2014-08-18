# encoding: UTF-8
module Admin
  class PresponsablesController < BasicasController
    before_action :set_presponsable, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "presponsable"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_presponsable
      @basica = Presponsable.find(params[:id])
    end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presponsable_params
      params.require(:presponsable).permit(*atributos_form)
    end

  end
end
