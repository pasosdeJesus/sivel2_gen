# encoding: UTF-8
class Vinculoestado < ActiveRecord::Base
	has_many :comunidad_vinculoestado, foreign_key: "id_vinculoestado", validate: true
	has_many :victima, foreign_key: "id_vinculoestado", validate: true
end
