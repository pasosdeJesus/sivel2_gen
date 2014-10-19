# encoding: UTF-8
class Tviolencia < ActiveRecord::Base
  include Basica

	has_many :supracategoria, foreign_key: "id_tviolencia", validate: true
	has_many :categoria, foreign_key: "id_tviolencia", validate: true

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
