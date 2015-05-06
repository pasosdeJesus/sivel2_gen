# encoding: UTF-8
module Sivel2Gen
  class Escolaridad < ActiveRecord::Base
    include Sip::Basica

    has_many :victimasjr, foreign_key: "id_escolaridad", 
      validate: true, class_name: 'Sivel2Gen::Victimasjr'
  end
end
