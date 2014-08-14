# encoding: UTF-8
class Respuesta < ActiveRecord::Base

  # Debería ser: belongs_to :casosjr, foreign_key: "id_caso", validate: true
  belongs_to :caso, foreign_key: "id_caso", validate: true

  has_many :ayudasjr, :through => :ayudasjr_respuesta
  has_many :ayudasjr_respuesta,  foreign_key: "id_respuesta", dependent: :destroy
  accepts_nested_attributes_for :ayudasjr_respuesta, allow_destroy: true, reject_if: :all_blank

  has_many :emprendimiento, :through => :emprendimiento_respuesta
  has_many :emprendimiento_respuesta,  foreign_key: "id_respuesta", dependent: :destroy
  accepts_nested_attributes_for :emprendimiento_respuesta, allow_destroy: true, reject_if: :all_blank

  has_many :aspsicosocial, :through => :aspsicosocial_respuesta
  has_many :aspsicosocial_respuesta,  foreign_key: "id_respuesta", dependent: :destroy
  accepts_nested_attributes_for :aspsicosocial_respuesta, allow_destroy: true, reject_if: :all_blank

  has_many :aslegal, :through => :aslegal_respuesta
  has_many :aslegal_respuesta,  foreign_key: "id_respuesta", dependent: :destroy
  accepts_nested_attributes_for :aslegal_respuesta, allow_destroy: true, reject_if: :all_blank

end
