# encoding: UTF-8
class Instanciader < ActiveRecord::Base
	has_many :procesosjr, foreign_key: "id_instanciader", validate: true
	has_many :procesosjr, foreign_key: "otrainstancia", validate: true
end
