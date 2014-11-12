# encoding: UTF-8
module Sivel2Gen
  class Frontera < ActiveRecord::Base
    include Basica

    has_many :caso_frontera, foreign_key: "id_frontera", validate: true, 
      class_name: 'Sivel2Gen::CasoFrontera'
    has_many :caso, through: :caso_frontera, class_name: 'Sivel2Gen::Caso'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
