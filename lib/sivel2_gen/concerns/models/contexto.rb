
module Sivel2Gen
  module Concerns
    module Models
      module Contexto 
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
            
          has_and_belongs_to_many :caso, 
            class_name: 'Sivel2Gen::Contexto',
            foreign_key: 'id_contexto', 
            association_foreign_key: 'id_caso',
            join_table: 'sivel2_gen_caso_contexto'

        end
      end
    end
  end
end

