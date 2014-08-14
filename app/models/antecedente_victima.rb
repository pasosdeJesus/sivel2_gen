# encoding: UTF-8
class AntecedenteVictima < ActiveRecord::Base
	belongs_to :antecedente, foreign_key: "id_antecedente", validate: true
	belongs_to :victima, foreign_key: "id_victima", validate: true
	belongs_to :persona, foreign_key: "id_persona", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
