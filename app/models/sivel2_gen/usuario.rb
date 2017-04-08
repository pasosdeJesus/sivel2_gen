# encoding: UTF-8

module Sivel2Gen
  class Usuario < Sip::Usuario

    has_many :caso_usuario, foreign_key: "id_usuario", validate: true,
      class_name: 'Sivel2Gen::CasoUsuario'
    has_many :caso_etiqueta, foreign_key: "id_usuario", validate: true,
      class_name: 'Sivel2Gen::CasoEtiqueta'

  end
end
