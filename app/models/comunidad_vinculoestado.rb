# encoding: UTF-8
class ComunidadVinculoestado < ActiveRecord::Base
	belongs_to :vinculoestado, foreign_key: "id_vinculoestado", validate: true
	belongs_to :grupoper, foreign_key: "id_grupoper", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
