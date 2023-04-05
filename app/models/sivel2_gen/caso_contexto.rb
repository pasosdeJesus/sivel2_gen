
module Sivel2Gen
  class CasoContexto < ActiveRecord::Base
    belongs_to :caso, foreign_key: "caso_id", 
      class_name: 'Sivel2Gen::Caso', optional: false
    belongs_to :contexto, foreign_key: "contexto_id", 
      class_name: 'Sivel2Gen::Contexto', optional: false
  end
end
