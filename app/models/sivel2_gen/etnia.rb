# encoding: UTF-8
module Sivel2Gen
  class Etnia < ActiveRecord::Base
    include Basica
    has_many :victima, foreign_key: "id_etnia", validate: true, 
      class_name: 'Sivel2Gen::Victima'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
