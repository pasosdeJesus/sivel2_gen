# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Contexto 
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          has_many :caso_contexto, foreign_key: "id_contexto", 
            class_name: 'Sivel2Gen::CasoContexto'
          has_many :caso, through: :caso_contexto, 
            class_name: 'Sivel2Gen::Contexto'
        end
      end
    end
  end
end

