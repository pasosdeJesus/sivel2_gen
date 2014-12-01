# encoding: UTF-8
module Sivel2Gen
  class Region < ActiveRecord::Base
    include Basica

    has_many :caso_region, foreign_key: "id_region", validate: true, 
      class_name: 'Sivel2Gen::CasoRegion'
    has_many :caso, through: :caso_region, class_name: 'Sivel2Gen::Caso'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
