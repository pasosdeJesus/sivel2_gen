# encoding: UTF-8
class Tviolencia < ActiveRecord::Base
	has_many :supracategoria, foreign_key: "id_tviolencia", validate: true
	has_many :categoria, foreign_key: "id_tviolencia", validate: true
end
