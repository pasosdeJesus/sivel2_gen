# encoding: UTF-8
module Sivel2Gen
  class Etiqueta < ActiveRecord::Base
    include Basica

    has_many :caso_etiqueta, foreign_key: "id_etiqueta", dependent: :delete_all,
      class_name: 'Sivel2Gen::CasoEtiqueta'
    has_many :caso, through: :caso_etiqueta, class_name: 'Sivel2Gen::Caso'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
