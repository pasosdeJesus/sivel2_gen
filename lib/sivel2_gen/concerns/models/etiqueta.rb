# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Etiqueta
        extend ActiveSupport::Concern

        include Sivel2Gen::Basica
        included do
          has_many :caso_etiqueta, class_name: 'Sivel2Gen::CasoEtiqueta',
            foreign_key: "id_etiqueta", dependent: :delete_all
          has_many :caso, class_name: 'Sivel2Gen::Caso',
            through: :caso_etiqueta

          validates :nombre, presence: true, allow_blank: false
          validates :fechacreacion, presence: true, allow_blank: false
        end
      end
    end
  end
end

