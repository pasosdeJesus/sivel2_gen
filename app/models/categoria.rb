# encoding: UTF-8
class Categoria < ActiveRecord::Base
	has_many :acto, foreign_key: "id_categoria", validate: true
	has_many :actosjr, foreign_key: "id_categoria", validate: true
	has_many :casosjr, foreign_key: "categoriaref", validate: true
	belongs_to :supracategoria, foreign_key: "id_supracategoria", validate: true
	belongs_to :tviolencia, foreign_key: "id_tviolencia", validate: true
end
