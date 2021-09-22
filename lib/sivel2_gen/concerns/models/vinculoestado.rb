
module Sivel2Gen
  module Concerns
    module Models
      module Vinculoestado
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          has_many :victimacolectiva_vinculoestado, 
            foreign_key: "id_vinculoestado", 
            validate: true, 
            class_name: 'Sivel2Gen::VictimacolectivaVinculoestado'
          has_many :victima, foreign_key: "id_vinculoestado", 
            class_name: 'Sivel2Gen::Victima'
          has_many :combatiente, class_name: 'Sivel2Gen::Combatiente',
            foreign_key: "id_vinculoestado" 
        end
      end
    end
  end
end

