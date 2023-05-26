
require 'msip/concerns/models/ubicacionpre'

module Sivel2Gen
  module Concerns
    module Models
      module Ubicacionpre
        extend ActiveSupport::Concern
        include Msip::Concerns::Models::Ubicacionpre

        included do
          has_many :caso_ubicacionpre, foreign_key: "ubicacionpre_id", 
            validate: true, dependent: :destroy, 
            class_name: 'Sivel2Gen::CasoUbicacionpre'
        end

      end
    end
  end
end

