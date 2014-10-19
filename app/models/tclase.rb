# encoding: UTF-8
class Tclase < ActiveRecord::Base
  include Basica

	has_many :clase, foreign_key: "id_tclase", validate: true

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
