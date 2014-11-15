# encoding: UTF-8
module Sivel2Gen
  module Admin
    class TsitiosController < BasicasController
      before_action :set_tsitio, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Tsitio

      def clase 
        "Sivel2Gen::Tsitio"
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
end
