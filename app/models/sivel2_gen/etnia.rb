# encoding: UTF-8
module Sivel2Gen
  class Etnia < ActiveRecord::Base
    include Sip::Basica
    has_many :victima, foreign_key: "id_etnia", validate: true, 
      class_name: 'Sivel2Gen::Victima'
  end
end
