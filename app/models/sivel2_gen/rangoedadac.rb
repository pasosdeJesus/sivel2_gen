# encoding: UTF-8
module Sivel2Gen
  class Rangoedadac < ActiveRecord::Base
    include Basica

    has_many :actividad_rangoedadac, :dependent => :delete_all,
      class_name: 'Sivel2Gen::ActividadRangoedadac'
    has_many :actividad, :through => :actividad_rangoedadac,
      class_name: 'Sivel2Gen::Actividad'

    validates :nombre, presence: true, allow_blank: false
    validates :fechacreacion, presence: true, allow_blank: false
  end
end
