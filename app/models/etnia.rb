# encoding: UTF-8
class Etnia < ActiveRecord::Base
	has_many :victima, foreign_key: "id_etnia", validate: true
end
