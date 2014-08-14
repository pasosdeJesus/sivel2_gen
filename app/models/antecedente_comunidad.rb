# encoding: UTF-8
class AntecedenteComunidad < ActiveRecord::Base
	belongs_to :antecedente, foreign_key: "id_antecedente", validate: true
	belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
