# encoding: UTF-8

module Sivel2Gen
  module Basica
    extend ActiveSupport::Concern

    included do
      scope :habilitados, -> (campoord = "nombre") {
        where(fechadeshabilitacion: nil).order(campoord.to_sym)
      }
    end

  end
end
