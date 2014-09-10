# encoding: UTF-8
class Actividadoficio < ActiveRecord::Base
  has_many :victimasjr, foreign_key: "id_actividadoficio", validate: true

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
