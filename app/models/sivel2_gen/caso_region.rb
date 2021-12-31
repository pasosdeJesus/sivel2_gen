
module Sivel2Gen
  class CasoRegion < ActiveRecord::Base
    belongs_to :region, foreign_key: "id_region", 
      class_name: 'Sivel2Gen::Region', optional: false
    belongs_to :caso, foreign_key: "id_caso", 
      class_name: 'Sivel2Gen::Caso', optional: false
  end
end
