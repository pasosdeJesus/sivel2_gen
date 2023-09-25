
require 'msip/concerns/controllers/personas_controller'
require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module PersonasController
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Controllers::PersonasController
 
          def atributos_show_sivel2_gen
            atributos_show_msip + [ :caso_ids ]
          end

          def atributos_show
            atributos_show_sivel2_gen
          end

          def atributos_form
            atributos_form_msip - [:caso_ids]
          end

          def remplazar_antes_destruir_p
            true
          end 

          # Están llenas @persona, @victima, @personaant, @caso
          # Y está listo para salvar la nueva persona @persona en
          # @victima --remplazando @personaant.
          # Continúa si esta función retorna true, de lo contrario
          # se espera que la función haga render json con el error
          # y que retorne false.
          def remplazar_antes_salvar_v
            true
          end 

          def remplazar_despues_salvar_v
            true
          end 

          def remplazarfamiliar
            @personados = Msip::Persona.find(params[:persona_id].to_i)
            @caso = Sivel2Gen::Caso.find(params[:caso_id])
            @victima = Sivel2Gen::Victima.find(params[:victima_id].to_i)
            @victima_cocoon = params[:victcocoon_id]
            @caso.current_usuario = current_usuario
            @trelacion1 = params[:trelacion_id1]
            respond_to do |format|
              format.html {
                render("/msip/personas/remplazar_familiar",
                       layout: false)
                return
              }
            end
          end

          def remplazar_sivel2_gen
            @persona = Msip::Persona.find(params[:persona_id].to_i)
            @victima = Sivel2Gen::Victima.find(params[:victima_id].to_i)
            @personaant = @victima.persona
            @caso = @victima.caso
            @caso.current_usuario = current_usuario
            @victima.persona = @persona
            if !remplazar_antes_salvar_v
              return
            end
            if Sivel2Gen::Victima.where(persona_id: @persona.id).
                where(caso_id: @caso.id).count == 0
              @victima.save!
            else
              puts "Ya existe esa persona en el caso"
              render json: "Ya existe esa persona en el caso",
                status: :unprocessable_entity
              return 
            end
            if !remplazar_despues_salvar_v
              return
            end
            if (@personaant.nombres == 'N' && 
                @personaant.apellidos == 'N') ||
              (@personaant.nombres == '' && @personaant.apellidos == '')
              if !remplazar_antes_destruir_p
                return
              end
              begin
              @personaant.destroy
              rescue e
              end
            end
            respond_to do |format|
              format.html { 
                render('/msip/personas/remplazar', layout: false) 
                return
              }
            end
          end

          def remplazar
            remplazar_sivel2_gen
          end

        end # included


        class_methods do
        end # class_methods
      end
    end
  end
end
