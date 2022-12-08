module Sivel2Gen
  class Pconsolidado < ActiveRecord::Base
    include Msip::Basica

    Nombresunicos=false
    has_many :categoria, foreign_key: "id_pconsolidado", validate: true, 
      class_name: 'Sivel2Gen::Categoria'

    def presenta_nombre
      self.id.to_s + " - " + self.nombre
    end
  end
end
