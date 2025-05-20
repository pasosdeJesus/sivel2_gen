# frozen_string_literal: true

module Sivel2Gen
  # Relación n:n entre Caso y Usuario (usuarios del sistema que han
  # interactuado con el caso)
  class CasoUsuario < ActiveRecord::Base
    belongs_to :usuario,
      validate: true,
      class_name: "Usuario",
      optional: false
    belongs_to :caso,
      validate: true,
      class_name: "Sivel2Gen::Caso",
      optional: false

    self.primary_key = :caso_id
    # No es la llave primaria --pues no hay-- pero se usa para que
    # pueda eliminar caso, como se describe en
    # http://stackoverflow.com/questions/23165282/error-zero-length-delimited-identifier-at-or-near-line-1-delete-from-reg
  end
end
