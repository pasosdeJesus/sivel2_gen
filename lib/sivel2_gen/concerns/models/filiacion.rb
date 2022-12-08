
module Sivel2Gen
  module Concerns
    module Models
      module Filiacion
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
                self.table_name = 'sivel2_gen_filiacion'

                has_and_belongs_to_many :victimacolectiva, 
                  foreign_key: 'id_filiacion', 
                  class: 'Sivel2Gen::Victimacolectiva',
                  join_table: 'sivel2_gen_filiacion_victimacolectiva'

                has_many :victima, foreign_key: 'id_filiacion', 
                        class_name: 'Sivel2Gen::Victima'

                has_many :combatiente, class_name: 'Sivel2Gen::Combatiente',
                        foreign_key: 'id_profesion' 
        end
      end
    end
  end
end

