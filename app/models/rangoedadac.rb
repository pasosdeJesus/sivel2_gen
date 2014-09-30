# encoding: UTF-8
class Rangoedadac < ActiveRecord::Base
  extend Basica

	has_many :actividad_rangoedadac, :dependent => :delete_all
	has_many :actividad, :through => :actividad_rangoedadac

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
