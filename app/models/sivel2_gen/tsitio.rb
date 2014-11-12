# encoding: UTF-8
module Sivel2Gen
  class Tsitio < ActiveRecord::Base
    include Basica

    has_many :ubicacion, foreign_key: "id_tsitio", validate: true,
      class_name: 'Sivel2Gen::Ubicacion'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
