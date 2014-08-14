# encoding: UTF-8
class Filiacion < Basica
	has_many :comunidad_filiacion, foreign_key: "id_filiacion", validate: true
	has_many :victima, foreign_key: "id_filiacion", validate: true
  def self.SININFO 
    10
  end
end
