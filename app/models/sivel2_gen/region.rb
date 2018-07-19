# encoding: UTF-8
module Sivel2Gen
  class Region < ActiveRecord::Base
    include Sip::Basica

    has_many :caso_region, foreign_key: "id_region", 
      dependent: :delete_all, class_name: 'Sivel2Gen::CasoRegion'
    has_many :caso, through: :caso_region, class_name: 'Sivel2Gen::Caso'
  end
end
