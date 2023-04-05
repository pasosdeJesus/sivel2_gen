
module Sivel2Gen
  class CasoRegion < ActiveRecord::Base
    belongs_to :region, foreign_key: "region_id", 
      class_name: 'Sivel2Gen::Region', optional: false
    belongs_to :caso, foreign_key: "caso_id", 
      class_name: 'Sivel2Gen::Caso', optional: false
  end
end
