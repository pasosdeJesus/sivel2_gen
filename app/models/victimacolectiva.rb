# encoding: UTF-8
class Victimacolectiva < ActiveRecord::Base
	belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
	belongs_to :presponsable, foreign_key: "organizacionarmada", validate: true
end
