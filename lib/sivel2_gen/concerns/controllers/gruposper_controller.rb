
require 'msip/concerns/controllers/gruposper_controller'

module Sivel2Gen
  module Concerns
    module Controllers
      module GruposperController
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Controllers::GruposperController

          def remplazar_antes_destruir_gp
          end 

          def remplazar_antes_salvar_vc
          end 

          # Busca y lista grupo(s) de persona
          def remplazar
            @grupoper = Msip::Grupoper.find(params[:id_grupoper].to_i)
            @victimacolectiva = Sivel2Gen::Victimacolectiva.find(
              params[:id_victimacolectiva].to_i)
            grupoperant = @victimacolectiva.grupoper
            @caso = @victimacolectiva.caso
            @caso.current_usuario = current_usuario
            @victimacolectiva.grupoper = @grupoper
            remplazar_antes_salvar_vc
            @victimacolectiva.save!
            if (grupoperant.nombre == 'N') ||
              (grupoperant.nombre == '')
              remplazar_antes_destruir_gp
              grupoperant.destroy
            end
            respond_to do |format|
              format.html { render('remplazar', layout: false) }
            end
          end


        end # included


      end
    end
  end
end
