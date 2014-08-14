# encoding: UTF-8
class Victima < ActiveRecord::Base
	#has_many :antecedente_victima, foreign_key: [:id_persona, :id_caso], validate: true, dependent: :destroy
	has_one :victimasjr, foreign_key: "id_victima", inverse_of: :victima, validate: true, dependent: :destroy

	# En el orden de esquema en base 
	belongs_to :caso, foreign_key: "id_caso", validate: true
	belongs_to :etnia, foreign_key: "id_etnia", validate: true
	belongs_to :filiacion, foreign_key: "id_filiacion", validate: true
	belongs_to :iglesia, foreign_key: "id_iglesia", validate: true
	belongs_to :organizacion, foreign_key: "id_organizacion", validate: true
	belongs_to :persona, foreign_key: "id_persona", validate: true
	accepts_nested_attributes_for :persona, reject_if: :all_blank
	belongs_to :profesion, foreign_key: "id_profesion", validate: true
	belongs_to :rangoedad, foreign_key: "id_rangoedad", validate: true
	belongs_to :sectorsocial, foreign_key: "id_sectorsocial", validate: true
	belongs_to :vinculoestado, foreign_key: "id_vinculoestado", validate: true
	belongs_to :presponsable, foreign_key: "organizacionarmada", validate: true

  has_one   :victimasjr, foreign_key: "id_victima", validate: true, dependent: :destroy
	accepts_nested_attributes_for :victimasjr, reject_if: :all_blank, update_only: true

end
