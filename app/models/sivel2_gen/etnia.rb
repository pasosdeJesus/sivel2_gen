module Sivel2Gen
  class Etnia < ActiveRecord::Base
    include Msip::Basica
    has_many :victima, foreign_key: "id_etnia", validate: true, 
      class_name: 'Sivel2Gen::Victima'
  end
end
