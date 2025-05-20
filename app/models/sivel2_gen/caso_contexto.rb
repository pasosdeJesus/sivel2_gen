# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Caso y Contexto
  class CasoContexto < ActiveRecord::Base
    belongs_to :caso,
      class_name: "Sivel2Gen::Caso",
      optional: false
    belongs_to :contexto,
      class_name: "Sivel2Gen::Contexto",
      optional: false
  end
end
