# encoding: UTF-8
class CasoEtiqueta < ActiveRecord::Base

  self.table_name = 'caso_etiqueta'
	belongs_to :caso, foreign_key: "id_caso", validate: true, 
		inverse_of: :caso_etiqueta
	belongs_to :etiqueta, foreign_key: "id_etiqueta", validate: true
	belongs_to :usuario, foreign_key: "id_usuario", validate: true

	validates_presence_of :fecha

end
