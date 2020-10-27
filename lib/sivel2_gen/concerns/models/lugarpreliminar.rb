# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Lugarpreliminar
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo
          include Sip::Localizacion

          campofecha_localizado :fecha
        end
      end
    end
  end
end
