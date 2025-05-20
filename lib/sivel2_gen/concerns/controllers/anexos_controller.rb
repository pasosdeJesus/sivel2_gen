# frozen_string_literal: true

require "msip/concerns/controllers/anexos_controller"
require "date"

module Sivel2Gen
  module Concerns
    module Controllers
      module AnexosController
        extend ActiveSupport::Concern

        included do
          include Msip::Concerns::Controllers::AnexosController

          def remplazar_antes_salvar_v
            true
          end

          def remplazar_despues_salvar_v
            true
          end
        end # included

        class_methods do
        end # class_methods
      end
    end
  end
end
