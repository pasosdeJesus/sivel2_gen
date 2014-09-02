# encoding: UTF-8
class Region < ActiveRecord::Base
	has_many :caso_region, foreign_key: "id_region", validate: true
	has_many :caso, through: :caso_region
end
