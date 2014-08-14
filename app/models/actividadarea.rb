# encoding: UTF-8
class Actividadarea < ActiveRecord::Base
  has_many :actividadareas_actividad, :dependent => :delete_all
  has_many :actividades, :through => :actividadareas_actividad
end
