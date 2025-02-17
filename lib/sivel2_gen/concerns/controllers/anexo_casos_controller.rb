# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Controllers
      module AnexoCasosController
        extend ActiveSupport::Concern

        included do
          before_action :prepara_caso

          def destroy
          end

          def create
          end

          private

          def prepara_caso
            @caso = Sivel2Gen::Caso.new(
              anexo_caso: [Sivel2Gen::AnexoCaso.new],
            )
          end
        end # included
      end
    end
  end
end
