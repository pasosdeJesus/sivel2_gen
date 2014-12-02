# encoding: UTF-8
module Sivel2Gen
  class Actividadoficio < ActiveRecord::Base
    include Basica

    has_many :victimasjr, foreign_key: "id_actividadoficio", 
      validate: true, class_name: 'Sivel2Gen::Victimasjr'
  end
end
