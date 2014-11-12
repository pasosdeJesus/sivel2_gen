# encoding: UTF-8
module Sivel2Gen
  class ActividadRangoedadac < ActiveRecord::Base
    belongs_to :actividad, class_name: 'Sivel2Gen::Actividad'
    belongs_to :rangoedadac, class_name: 'Sivel2Gen::Rangoedadac'
  end
end
