# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Actividadoficio
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          #has_many :victimasjr, foreign_key: "id_actividadoficio", 
          #  validate: true, class_name: 'Sivel2Gen::Victimasjr'
        end

      end
    end
  end
end
