# encoding: UTF-8
class Tsitio < ActiveRecord::Base
  extend Basica

	has_many :ubicacion, foreign_key: "id_tsitio", validate: true

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
