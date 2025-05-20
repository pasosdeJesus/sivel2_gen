# frozen_string_literal: true

module Sivel2Gen
  # Relación entre Rango de Edad y Víctima Colectiva
  class RangoedadVictimacolectiva < ActiveRecord::Base
    belongs_to :rangoedad,
      validate: true,
      class_name: "Sivel2Gen::Rangoedad",
      optional: false
    belongs_to :victimacolectiva,
      validate: true,
      class_name: "Sivel2Gen::Victimacolectiva",
      optional: false
  end
end
