
module Sivel2Gen
  module Concerns
    module Controllers
      module ActosController
        extend ActiveSupport::Concern

        included do

          # @param merr colchón para mensajes de error en caso de retornar fals
          # @return true sii pasan validaciones extra
          def pasan_validaciones_create?(merr)
            return true
          end

          def completar_acto(acto, params)
          end

          def create_sivel2_gen
            @merr = ""
            params2 = {}
            if (!params[:caso] && !params2['caso'])
              @merr = 'Faltan paramétros de caso'
              render inline: @merr, status: :unprocessable_entity
              return
            elsif (params[:caso] && params[:caso][:id].nil?) ||
              (params2['caso'] && params2['caso']['id'].nil?)
              @merr = 'Falta identificacion del caso'
              render inline: @merr, status: :unprocessable_entity
              return
            elsif (params[:caso] && !params[:caso_acto_presponsable_id]) ||
              (params2['caso'] && !params2['caso_acto_presponsable_id'])
              @merr = 'Debe tener Presunto Responsable' 
              render inline: @merr, status: :unprocessable_entity
              return
              #respond_to do |format|
              #  format.html { render inline: 'Debe tener Presunto Responsable' }
              #end
              #return
            elsif (params[:caso] && !params[:caso_acto_categoria_id]) ||
              (params2['caso'] && !params2['caso_acto_categoria_id'])
              @merr =  'Debe tener Categoria'
              render inline: @merr, status: :unprocessable_entity
              return
            elsif (params[:caso] && !params[:caso_acto_persona_id]) ||
              (params2['caso'] && !params2['caso_acto_persona_id'])
              @merr = 'Debe tener Víctima'
              render inline: @merr, status: :unprocessable_entity
              return
            elsif !pasan_validaciones_create?(@merr)
              render inline: @merr, status: :unprocessable_entity
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
                      acto = Sivel2Gen::Acto.new(
                        presponsable_id: presp,
                        categoria_id: cat,
                        persona_id: vic,
                      )
                      acto.caso = @caso
                      completar_acto(acto, params)
                      if !acto.valid?
                        if acto.errors.messages[:acto].count > 0
                          @merr = acto.errors.messages[:acto].join(". ")
                        end
                      else
                        acto.save!
                      end
                    end
                  end
                end
              end
            end
          end

          def create
            create_sivel2_gen
          end

          def destroy_sivel2_gen
            acto_id = params[:id]
            acto = Acto.where(id: acto_id).take
            if acto
              @caso = acto.caso
              acto.destroy!
            end
          end

          def destroy
            destroy_sivel2_gen
          end

        end

      end
    end
  end
end

