module Sivel2Gen
  # Tabla básica Parametros de Reporte Consolidado
  class Pconsolidado < ActiveRecord::Base
    include Msip::Basica

    Nombresunicos=false
    has_many :categoria, foreign_key: "pconsolidado_id", validate: true, 
      class_name: 'Sivel2Gen::Categoria'

    def presenta_nombre
      self.id.to_s + " - " + self.nombre
    end
  end
end
