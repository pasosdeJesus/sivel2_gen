# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Caso y Región
  class CasoRegion < ActiveRecord::Base
    belongs_to :region,
      class_name: "Sivel2Gen::Region",
      optional: false
    belongs_to :caso,
      class_name: "Sivel2Gen::Caso",
      optional: false
  end
end
