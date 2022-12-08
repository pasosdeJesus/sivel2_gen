
require 'msip/concerns/models/usuario'

module Sivel2Gen
  module Concerns
    module Models
      module Usuario
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Models::Usuario

          has_many :caso_usuario, foreign_key: "id_usuario", validate: true,
            class_name: 'Sivel2Gen::CasoUsuario'
          
          has_many :caso_etiqueta, foreign_key: "id_usuario", validate: true,
            class_name: 'Sivel2Gen::CasoEtiqueta'

          has_and_belongs_to_many :filtrodepartamento, 
            foreign_key: :usuario_id, 
            validate: true,
            class_name: 'Msip::Departamento',
            association_foreign_key: 'departamento_id',
            join_table: :sivel2_gen_observador_filtrodepartamento

          campofecha_localizado :observadorffechaini
          campofecha_localizado :observadorffechafin

          validate :obsfechaini_antes_fechafin

          def obsfechaini_antes_fechafin
            if observadorffechaini && observadorffechafin &&
              observadorffechaini > observadorffechafin 
              errors.add(:observadorffechaini,
                         'La fecha inicial para el filtro de observador ' +
                         'debe ser anterior a la final')
            end
          end

        end
      end
    end
  end
end
