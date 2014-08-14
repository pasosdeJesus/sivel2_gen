# encoding: UTF-8
class Escolaridad < ActiveRecord::Base
	has_many :victimasjr, foreign_key: "id_escolaridad", validate: true
end
