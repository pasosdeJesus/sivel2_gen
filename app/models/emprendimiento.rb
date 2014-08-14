# encoding: UTF-8
class Emprendimiento < ActiveRecord::Base
  has_many :respuesta, :through => :emprendimiento_respuesta
	has_many :emprendimiento_respuesta, foreign_key: "id_emprendimiento", validate: true, dependent: :destroy
end
