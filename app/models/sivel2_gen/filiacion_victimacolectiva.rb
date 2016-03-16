# encoding: UTF-8
module Sivel2Gen
  class FiliacionVictimacolectiva < ActiveRecord::Base
    belongs_to :filiacion, foreign_key: "id_filiacion", 
      validate: true, class_name: 'Sivel2Gen::Filiacion'
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
  end
end
