
module Sivel2Gen
  class CasoRegion < ActiveRecord::Base
    belongs_to :region, foreign_key: "id_region", 
      class_name: 'Sivel2Gen::Region'
    belongs_to :caso, foreign_key: "id_caso", 
      class_name: 'Sivel2Gen::Caso'
  end
end
