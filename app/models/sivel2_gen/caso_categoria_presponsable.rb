
module Sivel2Gen
  class CasoCategoriaPresponsable < ActiveRecord::Base
    belongs_to :categoria, foreign_key: "id_categoria", validate: true, 
      class_name: 'Sivel2Gen::Categoria', optional: false
    belongs_to :caso_presponsable, foreign_key: "id_caso_presponsable", 
      validate: true, class_name: 'Sivel2Gen::CasoPresponsable', 
      optional: false
  end
end
