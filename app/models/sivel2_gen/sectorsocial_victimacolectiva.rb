
module Sivel2Gen
  class SectorsocialVictimacolectiva < ActiveRecord::Base
    belongs_to :sectorsocial, foreign_key: "id_sectorsocial", 
      validate: true, class_name: 'Sivel2Gen::Sectorsocial', optional: false
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva', 
      optional: false
  end
end
