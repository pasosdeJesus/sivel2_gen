# encoding: UTF-8
class Profesion < ActiveRecord::Base
	has_many :comunidad_profesion, foreign_key: "id_profesion", validate: true
	has_many :victima, foreign_key: "id_profesion", validate: true

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
