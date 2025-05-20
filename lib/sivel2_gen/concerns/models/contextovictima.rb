# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Contextovictima
        extend ActiveSupport::Concern

        included do
          include Msip::Basica
        end
      end
    end
  end
end
