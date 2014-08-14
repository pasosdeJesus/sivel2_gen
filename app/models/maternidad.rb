# encoding: UTF-8
class Maternidad < ActiveRecord::Base
	has_many :victimasjr, foreign_key: "id_maternidad", validate: true
end
