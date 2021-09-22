
module Sivel2Gen
  class ProfesionVictimacolectiva < ActiveRecord::Base
    belongs_to :profesion, foreign_key: "id_profesion", validate: true, 
      class_name: 'Sivel2Gen::Profesion'
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
  end
end
