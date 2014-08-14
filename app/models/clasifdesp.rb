# encoding: UTF-8
class Clasifdesp < ActiveRecord::Base
	has_many :desplazamiento, foreign_key: "id_clasifdesp", validate: true
end
