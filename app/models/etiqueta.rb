# encoding: UTF-8
require 'basica'
class Etiqueta < ActiveRecord::Base
  include Basica

	has_many :caso_etiqueta, foreign_key: "id_etiqueta", dependent: :delete_all
	has_many :caso, through: :caso_etiqueta

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
