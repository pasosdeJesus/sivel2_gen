# encoding: UTF-8
class Fotra < ActiveRecord::Base
	has_many :caso_fotra, foreign_key: "id_fotra", validate: true
	has_many :anexo, foreign_key: "id_fotra", validate: true
end
