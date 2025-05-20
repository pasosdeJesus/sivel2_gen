# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Antecedente y Víctima Colectiva
  class AntecedenteVictimacolectiva < ActiveRecord::Base
    belongs_to :antecedente,
      validate: true,
      class_name: "Sivel2Gen::Antecedente",
      optional: false
    belongs_to :victimacolectiva,
      validate: true,
      class_name: "Sivel2Gen::Victimacolectiva",
      optional: false
  end
end
