# encoding: UTF-8
module Admin
  class TclasesController < BasicasController
    before_action :set_tclase, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def clase 
      "tclase"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tclase
      @basica = Tclase.find(params[:id])
    end

		def atributos_form
			atributos_index
		end

		def genclase
			return 'M';
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tclase_params
      params.require(:tclase).permit(*atributos_form)
    end

  end
end
