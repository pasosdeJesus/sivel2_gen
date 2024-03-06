
module Sivel2Gen
  module Concerns
    module Controllers
      module ActosController
        extend ActiveSupport::Concern

        included do

          def create
            params2 = {}
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
                      acto = Sivel2Gen::Acto.new(
                        presponsable_id: presp,
                        categoria_id: cat,
                        persona_id: vic,
                      )
                      acto.caso = @caso
                      if !acto.valid?
                        merr = ""
                        if acto.errors.messages[:acto].count > 0
                          merr = acto.errors.messages[:acto].join(". ")
                        end
                        render inline: "Problema. " + merr, 
                          status: :unprocessable_entity
#                        respond_to do |format|
#                          redirect_to :root,
#                          format.html { 
#                            render inline: "Problema con acto. " + merr
#                          }
#                        end
                        return
                      end
                      acto.save!
                    end
                  end
                end
              end
            end
          end


          def destroy
            acto_id = params[:id]
            acto = Acto.where(id: acto_id).take
            if acto
              @caso = acto.caso
              acto.destroy!
            end
          end

        end

      end
    end
  end
end

