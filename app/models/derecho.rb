# encoding: UTF-8
class Derecho < ActiveRecord::Base
	has_many :derecho_procesosjr, foreign_key: "id_derecho", validate: true
	has_many :derecho_respuesta, foreign_key: "id_derecho", validate: true
end
