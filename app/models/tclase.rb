# encoding: UTF-8
class Tclase < ActiveRecord::Base
	has_many :clase, foreign_key: "id_tclase", validate: true
end
