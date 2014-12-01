# encoding: UTF-8
module Sivel2Gen
  class CasoUsuario < ActiveRecord::Base
    belongs_to :usuario, foreign_key: "id_usuario", validate: true,
       class_name: 'Usuario'
    belongs_to :caso, foreign_key: "id_caso", validate: true,
       class_name: 'Sivel2Gen::Caso'

    self.primary_key = :id_caso
    # No es la llave primaria --pues no hay-- pero se usa para que
    # pueda eliminar caso, como se describe en
    # http://stackoverflow.com/questions/23165282/error-zero-length-delimited-identifier-at-or-near-line-1-delete-from-reg
  end
end
