
require 'sivel2_gen/concerns/models/tviolencia'

module Sivel2Gen
  # Tabla básica Tipo de Violencia (un tipo de violencia puede tener varias
  # supracategorias).
  # Es como un bosque cuyo primer nivel son Tipos de Violencia, el 
  # segundo nivel son supracategorías y el tercer nivel son Categorias
  class Tviolencia < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Tviolencia
  end
end
