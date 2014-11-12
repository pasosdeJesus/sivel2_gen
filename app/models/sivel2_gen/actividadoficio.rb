# encoding: UTF-8
module Sivel2Gen
  class Actividadoficio < ActiveRecord::Base
    include Basica

    has_many :victimasjr, foreign_key: "id_actividadoficio", 
      validate: true, class_name: 'Sivel2Gen::Victimasjr'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
