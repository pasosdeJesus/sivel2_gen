# encoding: UTF-8
class Antecedente < ActiveRecord::Base
	has_many :antecedente_caso, foreign_key: "id_antecedente", validate: true
	has_many :antecedente_comunidad, foreign_key: "id_antecedente", validate: true
	has_many :antecedente_victima, foreign_key: "id_antecedente", validate: true
end
