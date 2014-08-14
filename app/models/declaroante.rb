# encoding: UTF-8
class Declaroante < ActiveRecord::Base
	has_many :desplazamiento, foreign_key: "id_declaroante", validate: true
end
