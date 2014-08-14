# encoding: UTF-8
class Estadocivil < ActiveRecord::Base
	has_many :victimasjr, foreign_key: "id_estadocivil", validate: true
end
