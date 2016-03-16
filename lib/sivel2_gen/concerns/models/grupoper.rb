# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Grupoper
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sivel2_gen_grupoper'
          has_many :actocolectivo, foreign_key: 'id_grupoper', validate: true,
            class_name: 'Sivel2Gen::Actocolectivo'
          has_many :antecedente_comunidad, foreign_key: 'id_grupoper',
            validate: true, class_name: 'Sivel2Gen::AntecedenteComunidad'
          has_many :victimacolectiva, foreign_key: 'id_grupoper',
            validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
          has_many :casos, :through => :victimacolectiva

          validates :nombre, presence: true, allow_blank: false, 
            length: { maximum: 500 }
          validates :anotaciones, length: { maximum: 500 }
        end

      end
    end
  end
end

