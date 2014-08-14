# encoding: UTF-8
class Personadesea < ActiveRecord::Base
	has_many :respuesta, foreign_key: "id_personadesea", validate: true
end
