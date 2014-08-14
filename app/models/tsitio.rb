# encoding: UTF-8
class Tsitio < ActiveRecord::Base
	has_many :ubicacion, foreign_key: "id_tsitio", validate: true
end
