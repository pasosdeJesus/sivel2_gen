# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Sector social y Víctima Colectiva
  class SectorsocialVictimacolectiva < ActiveRecord::Base
    belongs_to :sectorsocial,
      validate: true,
      class_name: "Sivel2Gen::Sectorsocial",
      optional: false
    belongs_to :victimacolectiva,
      validate: true,
      class_name: "Sivel2Gen::Victimacolectiva",
      optional: false
  end
end
