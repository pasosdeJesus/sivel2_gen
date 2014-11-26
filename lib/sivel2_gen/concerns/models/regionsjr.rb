# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Regionsjr
        extend ActiveSupport::Concern
        include Sivel2Gen::Basica

        included do
          has_many :actividad, class_name: 'Sivel2Gen::Actividad'
          has_many :usuario

          validates_presence_of :nombre
          validates_presence_of :fechacreacion
        end

      end
    end
  end
end
