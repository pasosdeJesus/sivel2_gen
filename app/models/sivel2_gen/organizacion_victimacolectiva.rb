# encoding: UTF-8
module Sivel2Gen
  class OrganizacionVictimacolectiva < ActiveRecord::Base
    belongs_to :organizacion, foreign_key: "id_organizacion", 
      validate: true, class_name: 'Sivel2Gen::Organizacion'
    belongs_to :victimacolectiva, foreign_key: "victimacolectiva_id", 
      validate: true, class_name: 'Sivel2Gen::Victimacolectiva'
  end
end

