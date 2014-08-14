# encoding: UTF-8
class Comosupo < ActiveRecord::Base
	has_many :casosjr

	validates_presence_of :nombre
	validates_presence_of :fechacreacion
end
