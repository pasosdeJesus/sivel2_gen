
module Sivel2Gen
  module Concerns
    module Models
      module Fotra
        class Fotra < ActiveRecord::Base
        extend ActiveSupport::Concern

          included do
            has_many :caso_fotra, foreign_key: "id_fotra", 
              validate: true, dependent: :destroy,
              class_name: 'Sivel2Gen::Fotra'
            has_many :anexocaso, foreign_key: "id_fotra", validate: true,
              class_name: 'Sivel2Gen::AnexoCaso'

            validates :nombre, presence: true
          end
        end
      end
    end
  end
end
