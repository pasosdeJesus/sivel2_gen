
require 'msip/concerns/models/anexo'

module Sivel2Gen
  module Concerns
    module Models
      module Anexo
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Models::Anexo

          has_many :anexo_caso, foreign_key: "anexo_id", 
            validate: true, class_name: 'Sivel2Gen::AnexoCaso', inverse_of: :msip_anexo
          has_many :caso, class_name: 'Sivel2Gen::Caso',
            through: :anexo_caso, inverse_of: :msip_anexo
        end

        module ClassMethods
        end

      end
    end
  end
end
