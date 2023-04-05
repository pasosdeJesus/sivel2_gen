
module Sivel2Gen
  class ProfesionVictimacolectiva < ActiveRecord::Base
    belongs_to :profesion, foreign_key: "profesion_id", validate: true, 
      class_name: 'Sivel2Gen::Profesion', optional: false
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva', 
      optional: false
  end
end
