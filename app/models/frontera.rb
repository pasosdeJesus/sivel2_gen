# encoding: UTF-8
class Frontera < ActiveRecord::Base
	has_many :caso_frontera, foreign_key: "id_frontera", validate: true
	has_many :caso, through: :caso_frontera

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
