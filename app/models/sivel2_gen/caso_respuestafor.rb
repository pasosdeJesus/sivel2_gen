# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Caso y Respuesta a un formulario
  class CasoRespuestafor < ActiveRecord::Base
    belongs_to :respuestafor,
      class_name: "Mr519Gen::Respuestafor",
      optional: false
    accepts_nested_attributes_for :respuestafor,
      reject_if: :all_blank

    belongs_to :caso,
      class_name: "Sivel2Gen::Caso",
      optional: false
  end
end
