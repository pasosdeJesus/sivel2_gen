# encoding: UTF-8

module Sivel2Gen
  class RangoedadVictimacolectiva < ActiveRecord::Base
    belongs_to :rangoedad, foreign_key: "id_rangoedad", validate: true, 
      class_name: 'Sivel2Gen::Rangoedad'
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
  end
end
