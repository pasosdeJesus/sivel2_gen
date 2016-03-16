# encoding: UTF-8
module Sivel2Gen
  class Filiacion < ActiveRecord::Base
    include Sip::Basica

    has_many :filiacion_victimacolectiva, foreign_key: "id_filiacion", 
      validate: true, class_name: 'Sivel2Gen::FiliacionVictimacolectiva'
    has_many :victima, foreign_key: "id_filiacion", 
      class_name: 'Sivel2Gen::Victima'

    self.table_name = "sivel2_gen_filiacion"
  end
end
