# encoding: UTF-8
class Contexto < ActiveRecord::Base
	has_many :caso_contexto, foreign_key: "id_contexto", validate: true
end
