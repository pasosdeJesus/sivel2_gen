# encoding: UTF-8
module Sivel2Gen
  class Tsitio < ActiveRecord::Base
    include Basica

    has_many :ubicacion, foreign_key: "id_tsitio", validate: true,
      class_name: 'Sivel2Gen::Ubicacion'
  end
end
