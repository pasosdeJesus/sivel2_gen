# frozen_string_literal: true

module Sivel2Gen
  # Tabla básica Intervalo
  class Intervalo < ActiveRecord::Base
    include Msip::Basica

    has_many :caso,
      validate: true,
      class_name: "Sivel2Gen::Caso"

    validates :rango, presence: true
  end
end
