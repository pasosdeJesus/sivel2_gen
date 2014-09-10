# encoding: UTF-8
class Actividadarea < ActiveRecord::Base
  has_many :actividadareas_actividad, :dependent => :delete_all
  has_many :actividades, :through => :actividadareas_actividad

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
