# encoding: UTF-8
module Sivel2Gen
  class CasoEtiqueta < ActiveRecord::Base
    self.table_name = 'sivel2_gen_caso_etiqueta'

    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso', inverse_of: :caso_etiqueta
    belongs_to :etiqueta, foreign_key: "id_etiqueta", validate: true,
      class_name: 'Sivel2Gen::Etiqueta'
    belongs_to :usuario, foreign_key: "id_usuario", validate: true

    validates_presence_of :fecha
    validates_presence_of :id_etiqueta
  end
end
