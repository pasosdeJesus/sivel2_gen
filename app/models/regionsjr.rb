# encoding: UTF-8
class Regionsjr < ActiveRecord::Base
	validates_presence_of :nombre
	validates_presence_of :fechacreacion
end
