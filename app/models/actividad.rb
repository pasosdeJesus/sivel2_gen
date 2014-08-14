# encoding: UTF-8
class Actividad < ActiveRecord::Base
  @current_usuario = -1
  attr_accessor :current_usuario

  has_many :actividadareas_actividad, dependent: :delete_all
  has_many :actividadareas, through: :actividadareas_actividad
  has_many :rangoedadac, through: :actividad_rangoedadac
  accepts_nested_attributes_for :rangoedadac,  reject_if: :all_blank
  has_many :actividad_rangoedadac, foreign_key: "actividad_id", 
    dependent: :delete_all
  accepts_nested_attributes_for :actividad_rangoedadac, 
    allow_destroy: true, reject_if: :all_blank
  belongs_to :oficina, class_name: 'Regionsjr', foreign_key: 'regionsjr_id', 
    validate: true

  validates_presence_of :oficina
  validates_presence_of :nombre
  validates_presence_of :fecha

  validate :rol_usuario
  def rol_usuario
    if (current_usuario.rol == Ability::ROLSIST || 
        current_usuario.rol == Ability::ROLCOOR || 
        current_usuario.rol == Ability::ROLANALI)
      if (oficina.id != current_usuario.regionsjr_id)
        errors.add(:oficina, "Solo puede editar actividades de su oficina")
      end
    end
  end
end
