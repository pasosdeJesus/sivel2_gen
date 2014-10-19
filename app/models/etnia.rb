# encoding: UTF-8
class Etnia < ActiveRecord::Base
  include Basica

  has_many :victima, foreign_key: "id_etnia", validate: true

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
