# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Estadocivil
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          validates :nombre, presence: true, allow_blank: false
          validates :fechacreacion, presence: true, allow_blank: false
        end
      end
    end
  end
end
