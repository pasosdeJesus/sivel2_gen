# frozen_string_literal: true

require "msip/concerns/controllers/personas_trelacion_controller"

module Sivel2Gen
  module Concerns
    module Controllers
      module PersonasController
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Controllers::PersonasController
        end # included
      end
    end
  end
end
