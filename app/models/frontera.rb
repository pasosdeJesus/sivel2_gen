# encoding: UTF-8
class Frontera < ActiveRecord::Base
	has_many :caso_frontera, foreign_key: "id_frontera", validate: true
	has_many :caso, through: :caso_frontera
end
