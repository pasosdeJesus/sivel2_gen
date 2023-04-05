
module Sivel2Gen
  class CasoUsuario < ActiveRecord::Base
    belongs_to :usuario, foreign_key: "usuario_id", validate: true,
       class_name: 'Usuario', optional: false
    belongs_to :caso, foreign_key: "caso_id", validate: true,
       class_name: 'Sivel2Gen::Caso', optional: false

    self.primary_key = :caso_id
    # No es la llave primaria --pues no hay-- pero se usa para que
    # pueda eliminar caso, como se describe en
    # http://stackoverflow.com/questions/23165282/error-zero-length-delimited-identifier-at-or-near-line-1-delete-from-reg
  end
end
