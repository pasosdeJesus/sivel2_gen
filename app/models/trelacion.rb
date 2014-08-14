# encoding: UTF-8
class Trelacion < ActiveRecord::Base
	has_many :persona_trelacion, foreign_key: "id_trelacion", validate: true
end
