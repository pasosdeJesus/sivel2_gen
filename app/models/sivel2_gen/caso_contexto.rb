
module Sivel2Gen
  class CasoContexto < ActiveRecord::Base
    belongs_to :caso, foreign_key: "id_caso", 
      class_name: 'Sivel2Gen::Caso', optional: false
    belongs_to :contexto, foreign_key: "id_contexto", 
      class_name: 'Sivel2Gen::Contexto', optional: false
  end
end
