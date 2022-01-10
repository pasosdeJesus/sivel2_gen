require 'date'

module Sivel2Gen
  class ActosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Acto

    # Crea nuevos actos procesando parámetros
    def agregar
      if params[:caso][:id].nil?
        respond_to do |format|
          format.html { render inline: 'Falta identificacion del caso' }
        end
      elsif !params[:caso_acto_id_presponsable]
        respond_to do |format|
          format.html { render inline: 'Debe tener Presunto Responsable' }
        end
      elsif !params[:caso_acto_id_categoria]
        respond_to do |format|
          format.html { render inline: 'Debe tener Categoria' }
        end
      elsif !params[:caso_acto_id_persona]
        respond_to do |format|
          format.html { render inline: 'Debe tener Víctima' }
        end
      else
        params[:caso_acto_id_presponsable].each do |cpresp|
          presp = cpresp.to_i
          params[:caso_acto_id_categoria].each do |ccat|
            cat = ccat.to_i
            params[:caso_acto_id_persona].each do |cvic|
              vic = cvic.to_i
              @caso = Sivel2Gen::Caso.find(params[:caso][:id])
              @caso.current_usuario = current_usuario
              authorize! :update, @caso
              acto = Sivel2Gen::Acto.new(
                id_presponsable: presp,
                id_categoria: cat,
                id_persona: vic,
              )
              acto.caso = @caso
              acto.save
            end
          end
        end
      end
    
      respond_to do |format|
        format.js { render 'refrescar' }
      end
    end

    def eliminar
      acto = Acto.where(id: params[:id_acto].to_i).take
      if acto
        @caso = acto.caso
        acto.destroy!
      end
      respond_to do |format|
        format.js { render 'refrescar' }
      end
    end

    def destroy
      @registro = @acto = Sivel2Gen::Acto.where(id: params[:id]).take
      if @acto.nil?
        return
      end

      authorize! :destroy, @acto.caso
      @acto.destroy
      respond_to do |format|
        format.turbo_stream 
      end
    end

    def new
      @registro = @acto = @caso.actos.new
    end

    def create
      debugger
    end
  end
end
