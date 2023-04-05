require 'date'

module Sivel2Gen
  class ActosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Acto

    # Crea nuevos actos procesando parámetros
    def agregar
      params2 = {}
      if params[:_json]
        # Este es el formato generado por fetch
        params2 = Msip::ControladorHelper.convertir_arrnomval_diccionario(
          params[:_json])
      end
      if (!params[:caso] && !params2['caso'])
        respond_to do |format|
          format.html { render inline: 'Faltan paramétros de caso' }
        end
        return
      elsif (params[:caso] && params[:caso][:id].nil?) ||
        (params2['caso'] && params2['caso']['id'].nil?)
        respond_to do |format|
          format.html { render inline: 'Falta identificacion del caso' }
        end
        return
      elsif (params[:caso] && !params[:caso_acto_presponsable_id]) ||
        (params2['caso'] && !params2['caso_acto_presponsable_id'])
        respond_to do |format|
          format.html { render inline: 'Debe tener Presunto Responsable' }
        end
        return
      elsif (params[:caso] && !params[:caso_acto_categoria_id]) ||
        (params2['caso'] && !params2['caso_acto_categoria_id'])
        respond_to do |format|
          format.html { render inline: 'Debe tener Categoria' }
        end
        return
      elsif (params[:caso] && !params[:caso_acto_persona_id]) ||
        (params2['caso'] && !params2['caso_acto_persona_id'])
        respond_to do |format|
          format.html { render inline: 'Debe tener Víctima' }
        end
        return
      else
        lpresp = params[:caso] ? params[:caso_acto_presponsable_id] :
          params2['caso_acto_presponsable_id']['']
        lcat = params[:caso] ? params[:caso_acto_categoria_id] :
          params2['caso_acto_categoria_id']['']
        lper = params[:caso] ? params[:caso_acto_persona_id] :
          params2['caso_acto_persona_id']['']
        casoid = params[:caso] ? params[:caso][:id] :
          params2['caso']['id']

        lpresp.each do |cpresp|
          presp = cpresp.to_i
          lcat.each do |ccat|
            cat = ccat.to_i
            lper.each do |cvic|
              vic = cvic.to_i
              @caso = Sivel2Gen::Caso.find(casoid)
              @caso.current_usuario = current_usuario
              authorize! :update, @caso
              cacto = {
                presponsable_id: presp,
                categoria_id: cat,
                persona_id: vic,
                caso_id: @caso.id
              }
              if Sivel2Gen::Acto.where(cacto).count == 0
                Sivel2Gen::Acto.create!(
                  presponsable_id: presp,
                  categoria_id: cat,
                  persona_id: vic,
                  caso_id: @caso.id
                )
              end
            end
          end
        end

        respond_to do |format|
          format.js { 
            debugger # Con fetch ya no opera js, mejor no usar
            render partial: 'sivel2_gen/actos/actos_tabla' 
          }
          format.json { 
            # Con fetch llega aquí --no se ha lograr html
            render partial: 'sivel2_gen/actos/actos_tabla' 
          }
          format.html { 
            render partial: 'sivel2_gen/actos/actos_tabla' 
          }
        end
      end
    end


    def eliminar
      acto = Acto.where(id: params[:acto_id].to_i).take
      if acto
        @caso = acto.caso
        acto.destroy!
      end
      respond_to do |format|
        format.js { render 'refrescar' }
      end
    end

  end
end
