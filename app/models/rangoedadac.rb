# encoding: UTF-8
class Rangoedadac < ActiveRecord::Base
	has_many :actividad_rangoedadac, :dependent => :delete_all
	has_many :actividad, :through => :actividad_rangoedadac

  validates_presence_of :nombre
end
