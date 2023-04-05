
require 'msip/concerns/models/grupoper'

module Sivel2Gen
  module Concerns
    module Models
      module Grupoper
        extend ActiveSupport::Concern
        include Msip::Concerns::Models::Grupoper

        included do
          has_many :actocolectivo, foreign_key: 'grupoper_id', validate: true,
            class_name: 'Sivel2Gen::Actocolectivo'
          has_many :victimacolectiva, foreign_key: 'grupoper_id',
            validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
          has_many :casos, :through => :victimacolectiva

        end

      end
    end
  end
end

