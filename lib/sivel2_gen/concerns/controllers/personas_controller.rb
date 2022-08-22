
require 'sip/concerns/controllers/personas_controller'
require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module PersonasController
        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Controllers::PersonasController
 
          def atributos_show_sivel2_gen
            atributos_show_sip + [ :caso_ids ]
          end

          def atributos_show
            atributos_show_sivel2_gen
          end

          def atributos_form
            atributos_show - [:id, :caso_ids]
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
            @personados = Sip::Persona.find(params[:id_persona].to_i)
            @caso = Sivel2Gen::Caso.find(params[:id_caso])
            @victima = Sivel2Gen::Victima.find(params[:id_victima].to_i)
            @caso.current_usuario = current_usuario
            @trelacion1 = params[:id_trelacion1]
            respond_to do |format|
              format.html {
                render("/sip/personas/remplazar_familiar",
                       layout: false)
                return
              }
            end
          end

          def remplazar
            @persona = Sip::Persona.find(params[:id_persona].to_i)
            @victima = Sivel2Gen::Victima.find(params[:id_victima].to_i)
            @personaant = @victima.persona
            @caso = @victima.caso
            @caso.current_usuario = current_usuario
            @victima.persona = @persona
            if !remplazar_antes_salvar_v
              return
            end
            if Sivel2Gen::Victima.where(id_persona: @persona.id).
                where(id_caso: @caso.id).count == 0
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
                render('/sip/personas/remplazar', layout: false) 
                return
              }
            end
          end

        end # included


        class_methods do
        end # class_methods
      end
    end
  end
end
