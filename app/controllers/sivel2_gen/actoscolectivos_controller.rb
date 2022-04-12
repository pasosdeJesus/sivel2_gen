require 'date'

module Sivel2Gen
  class ActoscolectivosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Actocolectivo

    # Crea nuevos actos procesando parámetros
    def agregar
      if params[:caso][:id].nil?
        respond_to do |format|
          format.html { render inline: 'Falta identificacion del caso' }
        end
        return
      elsif !params[:caso_actocolectivo_id_presponsable]
        respond_to do |format|
          format.html { render inline: 'Debe tener Presunto Responsable' }
        end
        return
      elsif !params[:caso_actocolectivo_id_categoria]
        respond_to do |format|
          format.html { render inline: 'Debe tener Categoria' }
        end
        return
      elsif !params[:caso_actocolectivo_id_grupoper]
        respond_to do |format|
          format.html { render inline: 'Debe tener Víctima Colectiva' }
        end
        return
      else
        params[:caso_actocolectivo_id_presponsable].each do |cpresp|
          presp = cpresp.to_i
          params[:caso_actocolectivo_id_categoria].each do |ccat|
            cat = ccat.to_i
            params[:caso_actocolectivo_id_grupoper].each do |cvicc|
              vicc = cvicc.to_i
              @caso = Sivel2Gen::Caso.find(params[:caso][:id])
              @caso.current_usuario = current_usuario
              authorize! :update, @caso
              if Sivel2Gen::Actocolectivo.where(
                id_presponsable: presp,
                id_categoria: cat,
                id_grupoper: vicc,
                id_caso: @caso.id).count == 0 then
                actocolectivo = Sivel2Gen::Actocolectivo.new(
                  id_presponsable: presp,
                  id_categoria: cat,
                  id_grupoper: vicc,
                )
                actocolectivo.caso = @caso
                actocolectivo.save
              end
            end
          end
        end
      end
    
      respond_to do |format|
        format.js { render 'refrescar' }
        format.html {
          render partial: 'sivel2_gen/actoscolectivos/actoscolectivos_tabla'
        }
      end
    end

    def eliminar
      actocolectivo = Actocolectivo.where(id: params[:id_actocolectivo].to_i).take
      if actocolectivo
        @caso = actocolectivo.caso
        actocolectivo.destroy!
      end
      respond_to do |format|
        format.js { render 'refrescar' }
      end
    end

  end
end
