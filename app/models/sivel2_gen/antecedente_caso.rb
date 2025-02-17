# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Antecedente y Caso
  class AntecedenteCaso < ActiveRecord::Base
    belongs_to :antecedente,
      class_name: "Sivel2Gen::Antecedente",
      optional: false
    belongs_to :caso,
      class_name: "Sivel2Gen::Caso",
      optional: false
  end
end
