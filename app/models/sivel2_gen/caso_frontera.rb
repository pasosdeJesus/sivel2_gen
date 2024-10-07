
module Sivel2Gen
  # Relación n:n entre Caso y Frontera
  class CasoFrontera < ActiveRecord::Base
    belongs_to :frontera, foreign_key: "frontera_id", 
      class_name: 'Sivel2Gen::Frontera', optional: false
    belongs_to :caso, foreign_key: "caso_id", 
      class_name: 'Sivel2Gen::Caso', optional: false
  end
end
