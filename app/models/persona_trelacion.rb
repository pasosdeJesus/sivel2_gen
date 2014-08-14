# encoding: UTF-8
class PersonaTrelacion < ActiveRecord::Base
	belongs_to :persona, foreign_key: "persona1", validate: true
	belongs_to :persona, foreign_key: "persona2", validate: true
	belongs_to :trelacion, foreign_key: "id_trelacion", validate: true
end
