# encoding: UTF-8
module Sivel2Gen
  class Actividad < ActiveRecord::Base
    @current_usuario = -1
    attr_accessor :current_usuario

    has_many :actividadareas_actividad, dependent: :delete_all,
      class_name: 'Sivel2Gen::ActividadareasActividad'
    has_many :actividadareas, through: :actividadareas_actividad,
      class_name: 'Sivel2Gen::Actividadarea'
    has_many :actividad_rangoedadac, foreign_key: "actividad_id", 
      dependent: :delete_all, class_name: 'Sivel2Gen::ActividadRangoedadac'
    has_many :rangoedadac, through: :actividad_rangoedadac,
      class_name: 'Sivel2Gen::Rangoedadac'
    accepts_nested_attributes_for :rangoedadac,  reject_if: :all_blank
    accepts_nested_attributes_for :actividad_rangoedadac, 
      allow_destroy: true, reject_if: :all_blank
    has_many :anexoactividad, foreign_key: "actividad_id", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::Anexoactividad'
    accepts_nested_attributes_for :anexoactividad, allow_destroy: true, 
      reject_if: :all_blank

    belongs_to :oficina, class_name: 'Sivel2Gen::Regionsjr', 
      foreign_key: 'regionsjr_id', validate: true

    validates_presence_of :oficina
    validates_presence_of :nombre
    validates_presence_of :fecha
  end
end
