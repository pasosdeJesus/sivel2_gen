
module Sivel2Gen
  class Supracategoria < ActiveRecord::Base
    include Msip::Basica

    has_many :categoria, foreign_key: "supracategoria_id", 
      class_name: 'Sivel2Gen::Categoria'

    belongs_to :tviolencia, foreign_key: "tviolencia_id", 
      validate: true, class_name: 'Sivel2Gen::Tviolencia', optional: false

    validates :id, presence: true, uniqueness: true
    validates :tviolencia_id, presence: true

    validates :codigo, uniqueness: { 
      scope: :tviolencia_id,
      message: "Código debe ser único por tipo de violencia" }

    def presenta_nombre
      self.nombre + " (" + 
        Sivel2Gen::Tviolencia.find(self.tviolencia_id).nombre + ")"
    end
  end
end
