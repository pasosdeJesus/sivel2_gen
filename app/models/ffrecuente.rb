# encoding: UTF-8
class Ffrecuente < ActiveRecord::Base
	has_many :caso_ffrecuente, foreign_key: "id_ffrecuente", validate: true, 
    dependent: :destroy
	has_many :anexo, foreign_key: "id_ffrecuente", validate: true
end
