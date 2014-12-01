# encoding: UTF-8
module Sivel2Gen
  class Categoria < ActiveRecord::Base
    include Basica

    has_many :acto, foreign_key: "id_categoria", validate: true,
      class_name: 'Sivel2Gen::Acto'
    has_many :actosjr, foreign_key: "id_categoria", validate: true,
      class_name: 'Sivel2Gen::Actosjr'
    has_many :casosjr, foreign_key: "categoriaref", validate: true,
      class_name: 'Sivel2Gen::Casosjr'

    belongs_to :supracategoria, foreign_key: "id_supracategoria", 
      validate: true, class_name: 'Sivel2Gen::Supracategoria'
    belongs_to :tviolencia, foreign_key: "id_tviolencia", 
      validate: true, class_name: 'Sivel2Gen::Tviolencia'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
