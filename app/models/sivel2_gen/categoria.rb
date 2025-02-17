# frozen_string_literal: true

require "sivel2_gen/concerns/models/categoria"

module Sivel2Gen
  # Tabla básica Categoría de violencia. Una categoría está en una sola
  # supracategoría.
  # Es como un bosque cuyo primer nivel son Tipos de Violencia, el
  # segundo nivel son supracategorías y el tercer nivel son Categorias
  class Categoria < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Categoria
  end
end
