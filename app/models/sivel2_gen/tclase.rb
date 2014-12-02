# encoding: UTF-8
module Sivel2Gen
  class Tclase < ActiveRecord::Base
    include Basica

    has_many :clase, foreign_key: "id_tclase", validate: true, 
      class_name: 'Sivel2Gen::Clase'
  end
end
