# encoding: UTF-8
class Mecanismoder < ActiveRecord::Base
	has_many :procesosjr, foreign_key: "id_mecanismoder", validate: true
	has_many :procesosjr, foreign_key: "otromecanismo", validate: true
end
