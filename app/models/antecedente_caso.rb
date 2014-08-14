# encoding: UTF-8
class AntecedenteCaso < ActiveRecord::Base
	belongs_to :antecedente, foreign_key: "id_antecedente", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
