
module Sivel2Gen
  # Tabla básica Supracategoría (una supracategoría está en un único tipo
  # de violencia, y puede tener varias categorias).
  # Es como un bosque cuyo primer nivel son Tipos de Violencia, el 
  # segundo nivel son supracategorías y el tercer nivel son Categorias
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
