# encoding: UTF-8
module Sivel2Gen
  module Basica
    extend ActiveSupport::Concern

    def self.included(klass)
      klass.instance_eval do
        scope :habilitados, -> (campoord = "nombre") {
          where(fechadeshabilitacion: nil).order(campoord.to_sym)
        }
      end
    end
  end
end
