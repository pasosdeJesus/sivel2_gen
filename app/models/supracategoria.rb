# encoding: UTF-8
class Supracategoria < ActiveRecord::Base
  extend Basica

	has_many :categoria, foreign_key: "id_supracategoria", validate: true

	belongs_to :tviolencia, foreign_key: "id_tviolencia", validate: true

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
