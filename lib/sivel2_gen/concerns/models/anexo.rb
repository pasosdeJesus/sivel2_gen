
require 'msip/concerns/models/anexo'

module Sivel2Gen
  module Concerns
    module Models
      module Anexo
        extend ActiveSupport::Concern
        include Msip::Concerns::Models::Anexo

        included do
          has_many :anexo_caso, foreign_key: "anexo_id", 
            validate: true, class_name: 'Sivel2Gen::AnexoCaso'
          has_many :caso, class_name: 'Sivel2Gen::Caso',
            through: :anexo_caso
        end

        module ClassMethods
        end

      end
    end
  end
end
