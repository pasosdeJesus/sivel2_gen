# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Profesión y Víctima Colectiva
  class ProfesionVictimacolectiva < ActiveRecord::Base
    belongs_to :profesion,
      validate: true,
      class_name: "Sivel2Gen::Profesion",
      optional: false
    belongs_to :victimacolectiva,
      validate: true,
      class_name: "Sivel2Gen::Victimacolectiva",
      optional: false
  end
end
