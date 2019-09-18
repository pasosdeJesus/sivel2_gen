# encoding: UTF-8

require 'sip/concerns/controllers/personas_controller'
require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module PersonasController
        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Controllers::PersonasController

          def remplazar_antes_destruir_p
            true
          end 

          def remplazar_antes_salvar_v
            true
          end 

          def remplazar_despues_salvar_v
            true
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
            @victima.save!
            if !remplazar_despues_salvar_v
              return
            end
            if (@personaant.nombres == 'N' && 
                @personaant.apellidos == 'N') ||
              (@personaant.nombres == '' && @personaant.apellidos == '')
              if !remplazar_antes_destruir_p
                return
              end
              @personaant.destroy
            end
            respond_to do |format|
              format.html { render('/sip/personas/remplazar', layout: false) }
            end
          end

        end # included

      end
    end
  end
end
