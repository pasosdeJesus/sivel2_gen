# encoding: UTF-8

require 'sip/concerns/models/usuario'

module Sivel2Gen
  module Concerns
    module Models
      module Usuario
        extend ActiveSupport::Concern

        include Sip::Concerns::Models::Usuario

        included do
          has_many :caso_usuario, foreign_key: "id_usuario", validate: true,
            class_name: 'Sivel2Gen::CasoUsuario'
          
          has_many :caso_etiqueta, foreign_key: "id_usuario", validate: true,
            class_name: 'Sivel2Gen::CasoEtiqueta'
        end
      end
    end
  end
end
