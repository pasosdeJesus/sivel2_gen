# encoding: UTF-8
class Region < ActiveRecord::Base
  include Basica

	has_many :caso_region, foreign_key: "id_region", validate: true
	has_many :caso, through: :caso_region

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
