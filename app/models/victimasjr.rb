# encoding: UTF-8
class Victimasjr < ActiveRecord::Base

	# Orden de esquema en base
	belongs_to :actividadoficio, foreign_key: "id_actividadoficio", validate: true
	belongs_to :departamento, foreign_key: "id_departamento", validate: true
	belongs_to :escolaridad, foreign_key: "id_escolaridad", validate: true
	belongs_to :estadocivil, foreign_key: "id_estadocivil", validate: true
	belongs_to :maternidad, foreign_key: "id_maternidad", validate: true
	belongs_to :municipio, foreign_key: "id_municipio", validate: true
	belongs_to :pais, foreign_key: "id_pais", validate: true
	belongs_to :regimensalud, foreign_key: "id_regimensalud", validate: true
	belongs_to :rolfamilia, foreign_key: "id_rolfamilia", validate: true
	belongs_to :victima, foreign_key: "id_victima", validate: true
end
