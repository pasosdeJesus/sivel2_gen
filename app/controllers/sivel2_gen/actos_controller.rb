require 'date'

module Sivel2Gen
  class ActosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Acto

    # Crea nuevos actos procesando parámetros
    def agregar
      params2 = {}
      if params[:_json]
        # Este es el formato generado por fetch
        params2 = Sip::ControladorHelper.convertir_arrnomval_diccionario(
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
      elsif (params[:caso] && !params[:caso_acto_id_presponsable]) ||
        (params2['caso'] && !params2['caso_acto_id_presponsable'])
        respond_to do |format|
          format.html { render inline: 'Debe tener Presunto Responsable' }
        end
        return
      elsif (params[:caso] && !params[:caso_acto_id_categoria]) ||
        (params2['caso'] && !params2['caso_acto_id_categoria'])
        respond_to do |format|
          format.html { render inline: 'Debe tener Categoria' }
        end
        return
      elsif (params[:caso] && !params[:caso_acto_id_persona]) ||
        (params2['caso'] && !params2['caso_acto_id_persona'])
        respond_to do |format|
          format.html { render inline: 'Debe tener Víctima' }
        end
        return
      else
        lpresp = params[:caso] ? params[:caso_acto_id_presponsable] :
          params2['caso_acto_id_presponsable']['']
        lcat = params[:caso] ? params[:caso_acto_id_categoria] :
          params2['caso_acto_id_categoria']['']
        lper = params[:caso] ? params[:caso_acto_id_persona] :
          params2['caso_acto_id_persona']['']
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
                id_presponsable: presp,
                id_categoria: cat,
                id_persona: vic,
                id_caso: @caso.id
              }
              if Sivel2Gen::Acto.where(cacto).count == 0
                Sivel2Gen::Acto.create!(
                  id_presponsable: presp,
                  id_categoria: cat,
                  id_persona: vic,
                  id_caso: @caso.id
                )
              end
            end
          end
        end

        respond_to do |format|
          format.js { 
            # Con fetch ya no opera js aunque llega aquí
             render partial: 'sivel2_gen/actos/actos_tabla' 
           }
           format.html { 
             render 'actos_tabla' 
           }
         end
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

  end
end
