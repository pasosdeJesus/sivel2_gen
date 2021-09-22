
module Sivel2Gen
  class CasoFrontera < ActiveRecord::Base
    belongs_to :frontera, foreign_key: "id_frontera", 
      class_name: 'Sivel2Gen::Frontera'
    belongs_to :caso, foreign_key: "id_caso", 
      class_name: 'Sivel2Gen::Caso'
  end
end
