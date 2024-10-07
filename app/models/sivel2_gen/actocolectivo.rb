
require 'sivel2_gen/concerns/models/actocolectivo'

module Sivel2Gen
  # Acto de violencia contra un colectivo, basado en modelo de datos
  # "Who did what to whom" de Huridocs. Consta de: caso, presunto responsable,
  # categoría de violencia (debería ser colectiva), y grupo de personas
  # (la víctima colectiva se identifica por el caso y el grupo de personas)
  class Actocolectivo < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Actocolectivo
  end
end
