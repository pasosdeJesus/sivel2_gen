# encoding: UTF-8
class Grupoper < ActiveRecord::Base
  has_many :actocolectivo, foreign_key: "id_grupoper", validate: true
  has_many :antecedente_comunidad, foreign_key: "id_grupoper", validate: true
  has_many :comunidad_filiacion, foreign_key: "id_grupoper", validate: true
  has_many :comunidad_organizacion, foreign_key: "id_grupoper", validate: true
  has_many :comunidad_profesion, foreign_key: "id_grupoper", validate: true
  has_many :comunidad_rangoedad, foreign_key: "id_grupoper", validate: true
  has_many :comunidad_sectorsocial, foreign_key: "id_grupoper", validate: true
  has_many :comunidad_vinculoestado, foreign_key: "id_grupoper", validate: true
  has_many :victimacolectiva, foreign_key: "id_grupoper", validate: true
end
