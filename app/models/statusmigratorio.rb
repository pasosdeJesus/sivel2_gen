# encoding: UTF-8
class Statusmigratorio < ActiveRecord::Base
	has_many :casosjr, foreign_key: "id_statusmigratorio", validate: true

	validates_presence_of :nombre
	validates_presence_of :fechacreacion
end
