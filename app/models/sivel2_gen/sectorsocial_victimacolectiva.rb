
module Sivel2Gen
  # Relación n:n entre Sector social y Víctima Colectiva
  class SectorsocialVictimacolectiva < ActiveRecord::Base
    belongs_to :sectorsocial, foreign_key: "sectorsocial_id", 
      validate: true, class_name: 'Sivel2Gen::Sectorsocial', optional: false
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva', 
      optional: false
  end
end
