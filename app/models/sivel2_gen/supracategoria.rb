# encoding: UTF-8
module Sivel2Gen
  class Supracategoria < ActiveRecord::Base
    include Basica

    has_many :categoria, foreign_key: "id_supracategoria", validate: true, 
      class_name: 'Sivel2Gen::Categoria'

    belongs_to :tviolencia, foreign_key: "id_tviolencia", validate: true, 
      class_name: 'Sivel2Gen::Tviolencia'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
