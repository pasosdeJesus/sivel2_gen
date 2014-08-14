# encoding: UTF-8
class CasoCategoriaPresponsable < ActiveRecord::Base
	belongs_to :tviolencia, foreign_key: "id_tviolencia", validate: true
	belongs_to :categoria, foreign_key: "id_categoria", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
	belongs_to :presponsable, foreign_key: "id_presponsable", validate: true
	belongs_to :supracategoria, foreign_key: "id_supracategoria", validate: true
end
