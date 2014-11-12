# encoding: UTF-8
module Sivel2Gen
  class Regionsjr < ActiveRecord::Base
    include Basica

    has_many :actividad, class_name: 'Sivel2Gen::Actividad'
    has_many :usuario

    validates_presence_of :nombre
    validates_presence_of :fechacreacion
  end
end
