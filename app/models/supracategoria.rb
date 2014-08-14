# encoding: UTF-8
class Supracategoria < ActiveRecord::Base
	has_many :categoria, foreign_key: "id_supracategoria", validate: true
	belongs_to :tviolencia, foreign_key: "id_tviolencia", validate: true
end
