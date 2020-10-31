# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Lugarpreliminar
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo
          include Sip::Localizacion

          campofecha_localizado :fecha
          
          belongs_to :ubicacionpre, class_name: 'Sip::Ubicacionpre', 
            foreign_key: 'ubicacionpre_id', optional: true
          
          attr_accessor :ubicacionpre_texto
          attr_accessor :ubicacionpre_mundep_texto

          def ubicacionpre_texto
            if self.ubicacionpre
              self.ubicacionpre.nombre
            else
              ''
            end
          end


          def ubicacionpre_mundep_texto
            if self.ubicacionpre
              self.ubicacionpre.nombre_sin_pais
            else
              ''
            end
          end
        end
      end
    end
  end
end
