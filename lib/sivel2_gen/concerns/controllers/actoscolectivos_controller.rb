
module Sivel2Gen
  module Concerns
    module Controllers
      module ActoscolectivosController
        extend ActiveSupport::Concern

        included do

          # @param merr colchón para mensajes de error en caso de retornar fals
          # @return true sii pasan validaciones extra
          def pasan_validaciones_create?(merr)
            return true
          end

          def completar_actocolectivo(actocolectivo, params)
          end

          def create_sivel2_gen
            @merr = "" # Colchon para errores
            if params[:caso][:id].nil?
              @merr = 'Falta identificacion del caso' 
              render inline: @merr, status: :unprocessable_entity
              return
            elsif !params[:caso_actocolectivo_presponsable_id]
              @merr =  'Debe tener Presunto Responsable'
              render inline: @merr, status: :unprocessable_entity
              return
            elsif !params[:caso_actocolectivo_categoria_id]
              @merr = 'Debe tener Categoria'
              render inline: @merr, status: :unprocessable_entity
              return
            elsif !params[:caso_actocolectivo_grupoper_id]
              @merr = 'Debe tener Víctima Colectiva'
              render inline: @merr, status: :unprocessable_entity
              return
            elsif !pasan_validaciones_create?(@merr)
              render inline: @merr, status: :unprocessable_entity
              return
            else
              params[:caso_actocolectivo_presponsable_id].each do |cpresp|
                presp = cpresp.to_i
                params[:caso_actocolectivo_categoria_id].each do |ccat|
                  cat = ccat.to_i
                  params[:caso_actocolectivo_grupoper_id].each do |cvicc|
                    vicc = cvicc.to_i
                    @caso = Sivel2Gen::Caso.find(params[:caso][:id])
                    @caso.current_usuario = current_usuario
                    authorize! :update, @caso
                    if Sivel2Gen::Actocolectivo.where(
                        presponsable_id: presp,
                        categoria_id: cat,
                        grupoper_id: vicc,
                        caso_id: @caso.id).count == 0 then
                      actocolectivo = Sivel2Gen::Actocolectivo.new(
                        presponsable_id: presp,
                        categoria_id: cat,
                        grupoper_id: vicc,
                      )
                      actocolectivo.caso = @caso
                      completar_actocolectivo(actocolectivo, params)
                      if !actocolectivo.valid?
                        if actocolectivo.errors.messages[:actocolectivo].count > 0
                          @merr = actocolectivo.errors.messages[:actocolectivo].join(". ")
                        end
                      else
                        actocolectivo.save!
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
            actocolectivo = Actocolectivo.where(id: params[:id].to_i).take
            if actocolectivo
              @caso = actocolectivo.caso
              actocolectivo.destroy!
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

