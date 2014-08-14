# encoding: UTF-8
class Aspsicosocial < ActiveRecord::Base
  has_many :respuesta, :through => :aspsicosocial_respuesta
	has_many :aspsicosocial_respuesta, foreign_key: "id_aspsicosocial", 
    validate: true, dependent: :destroy
end
