
require 'msip/concerns/controllers/gruposper_controller'

module Sivel2Gen
  module Concerns
    module Controllers
      module GruposperController
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Controllers::GruposperController

          def remplazar_antes_destruir_gp
            true
          end 

          def remplazar_antes_salvar_vc
            true
          end

          def atributos_form
            atributos_show - [:id, :caso_ids]
          end

          # Busca y lista grupo(s) de persona
          def remplazar
            @grupoper = Msip::Grupoper.find(params[:grupoper_id].to_i)
            @caso = Sivel2Gen::Caso.find(params[:caso_id].to_i)
            @vicol_position = params[:vicol_position].to_i
            @caso.current_usuario = current_usuario
            if !remplazar_antes_salvar_vc
              return
            end
            if Sivel2Gen::Victimacolectiva.where(grupoper_id: @grupoper.id).
                where(caso_id: @caso.id).count == 0
              @victimacolectiva = Sivel2Gen::Victimacolectiva.create(
                grupoper_id: @grupoper.id, caso_id: @caso.id)
              @victimacolectiva.save!
              grupoperant = @victimacolectiva.grupoper
              if (grupoperant.nombre == 'N') || (grupoperant.nombre == '')
                remplazar_antes_destruir_gp
                grupoperant.destroy
              end
            else
              puts "Ya existe ese grupo de personas en el caso"
              render json: "Ya existe ese grupo de personas en el caso",
                status: :unprocessable_entity
              return 
            end
            respond_to do |format|
              format.html {
                render('/msip/gruposper/remplazar', layout: false) 
                return
              }
            end
          end


        end # included


      end
    end
  end
end
