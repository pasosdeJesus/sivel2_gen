# encoding: UTF-8
module Sivel2Gen
  class ActividadareasActividad < ActiveRecord::Base
    belongs_to :actividad, class_name: "Sivel2Gen::Actividad"
    belongs_to :actividadarea, class_name: "Sivel2Gen::Actividadarea"
  end
end
