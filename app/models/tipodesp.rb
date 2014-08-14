# encoding: UTF-8
class Tipodesp < ActiveRecord::Base
	has_many :desplazamiento, foreign_key: "id_tipodesp", validate: true
end
