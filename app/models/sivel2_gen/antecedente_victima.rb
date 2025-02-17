# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Antecedente y Víctima
  class AntecedenteVictima < ActiveRecord::Base
    belongs_to :antecedente,
      class_name: "Sivel2Gen::Antecedente",
      optional: false
    belongs_to :victima,
      class_name: "Sivel2Gen::Victima",
      optional: false
  end
end
