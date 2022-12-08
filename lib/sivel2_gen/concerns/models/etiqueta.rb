
require 'msip/concerns/models/etiqueta'

module Sivel2Gen
  module Concerns
    module Models
      module Etiqueta
        extend ActiveSupport::Concern
        include Msip::Concerns::Models::Etiqueta

        included do
          has_many :caso_etiqueta, class_name: 'Sivel2Gen::CasoEtiqueta',
            foreign_key: 'id_etiqueta', dependent: :delete_all
          has_many :caso, class_name: 'Sivel2Gen::Caso',
            through: :caso_etiqueta

        end
      end
    end
  end
end

