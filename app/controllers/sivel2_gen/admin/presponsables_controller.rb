# encoding: UTF-8
module Sivel2Gen
  module Admin
    class PresponsablesController < Sip::Admin::BasicasController
      before_action :set_presponsable, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Presponsable

      def clase 
        "Sivel2Gen::Presponsable"
      end

      def atributos_index
        [
          :id, 
          :nombre,
          :papa,
          :observaciones,
          :fechacreacion_localizada,
          :habilitado
        ]
      end

      def set_presponsable
        if params[:id].to_i > 0 
          @basica = Presponsable.find(params[:id])
        end
      end
  
      def genclase
        return 'M';
      end


      # Crea un nuevo registro para el caso que recibe por parametro 
      # params[:caso_id].  Pone valores simples en los campos requeridos
      def nuevo
        if !params[:caso_id].nil?
          @presponsable = CasoPresponsable.new
          @presponsable.id_caso = params[:caso_id]
          @presponsable.id_presponsable = 35
          @presponsable.tipo = 0
          if @presponsable.save
            respond_to do |format|
              format.js { render text: @presponsable.id.to_s }
              format.json { render json: @presponsable.id.to_s, status: :created }
              format.html { render inline: @presponsable.id.to_s }
            end
          else
            respond_to do |format|
              format.html { render action: "error" }
              format.json { render json: @presponsable.errors, status: :unprocessable_entity }
            end
          end
        else
          respond_to do |format|
            format.html { render inline: 'Falta identificacion del caso' }
          end
        end
      end


      def lista_params
        atributos_form - [:papa] + [:papa_id]
      end

      def presponsable_params
        params.require(:presponsable).permit(*lista_params)
      end
  
    end
  end
end
