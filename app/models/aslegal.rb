# encoding: UTF-8
class Aslegal < ActiveRecord::Base
  has_many :respuesta, :through => :aslegal_respuesta
	has_many :aslegal_respuesta, foreign_key: "id_aslegal", validate: true, dependent: :destroy
end
