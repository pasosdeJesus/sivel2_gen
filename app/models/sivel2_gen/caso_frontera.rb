# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Caso y Frontera
  class CasoFrontera < ActiveRecord::Base
    belongs_to :frontera,
      class_name: "Sivel2Gen::Frontera",
      optional: false
    belongs_to :caso,
      class_name: "Sivel2Gen::Caso",
      optional: false
  end
end
