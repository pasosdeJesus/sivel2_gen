# frozen_string_literal: true

module Sivel2Gen
  # Tabla básica Frontera
  class Frontera < ActiveRecord::Base
    include Msip::Basica

    has_many :caso_frontera,
      validate: true,
      dependent: :delete_all,
      class_name: "Sivel2Gen::CasoFrontera"
    has_many :caso, through: :caso_frontera, class_name: "Sivel2Gen::Caso"
  end
end
