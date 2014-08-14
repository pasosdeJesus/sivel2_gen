# encoding: UTF-8
class Regimensalud < ActiveRecord::Base
	has_many :victimasjr, foreign_key: "id_regimensalud", validate: true
end
