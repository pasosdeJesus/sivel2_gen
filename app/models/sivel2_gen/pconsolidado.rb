# frozen_string_literal: true

module Sivel2Gen
  # Tabla básica Parametros de Reporte Consolidado
  class Pconsolidado < ActiveRecord::Base
    include Msip::Basica

    Nombresunicos = false
    has_many :categoria,
      validate: true,
      class_name: "Sivel2Gen::Categoria"

    def presenta_nombre
      id.to_s + " - " + nombre
    end
  end
end
