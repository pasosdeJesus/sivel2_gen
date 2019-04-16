# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Tviolencia
        extend ActiveSupport::Concern

        included do
          include Sip::Basica
          
          has_many :supracategoria, foreign_key: "id_tviolencia", 
            validate: true, class_name: 'Sivel2Gen::Supracategoria'

          validates :id, presence:true, length: { maximum: 1 }, 
            uniqueness: {case_sensitive: false}

          def id=(val)
            self[:id] = val ? val.upcase.squish : nil
          end

        end # included

      end
    end
  end
end

