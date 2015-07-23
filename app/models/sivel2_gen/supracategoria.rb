# encoding: UTF-8
module Sivel2Gen
  class Supracategoria < ActiveRecord::Base
    include Sip::Basica

    has_many :categoria, foreign_key: "supracategoria_id", validate: true, 
      class_name: 'Sivel2Gen::Categoria'

    belongs_to :tviolencia, foreign_key: "id_tviolencia", validate: true, 
      class_name: 'Sivel2Gen::Tviolencia'

    validates :id_tviolencia, presence: true

    def presenta_nombre
      self.nombre + " (" + Sivel2Gen::Tviolencia.find(self.id_tviolencia).nombre + ")"
    end
  end
end
