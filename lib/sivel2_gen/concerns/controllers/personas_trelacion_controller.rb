
require 'sip/concerns/controllers/personas_trelacion_controller'

module Sivel2Gen
  module Concerns
    module Controllers
      module PersonasController
        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Controllers::PersonasController
        end # included

      end
    end
  end
end
