# encoding: UTF-8
class Filiacion < ActiveRecord::Base
  extend Basica

	has_many :comunidad_filiacion, foreign_key: "id_filiacion", validate: true
	has_many :victima, foreign_key: "id_filiacion"

  self.table_name = "filiacion"
end
