# encoding: UTF-8
class Casosjr < ActiveRecord::Base
	has_many :respuesta, foreign_key: "id_caso", validate: true, 
		dependent: :destroy

	# Ordenados por foreign_key para comparar con esquema en base
	belongs_to :usuario, foreign_key: "asesor", validate: true
	belongs_to :comosupo, foreign_key: "comosupo_id", validate: true
	belongs_to :contacto, class_name: "Persona", foreign_key: "contacto", 
		validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true, 
		inverse_of: :casosjr
	belongs_to :categoria, foreign_key: "categoriaref", validate: true
	belongs_to :idioma, foreign_key: "id_idioma", validate: true
	belongs_to :llegada, class_name: "Ubicacion", foreign_key: "id_llegada", 
		validate: true
	belongs_to :proteccion, foreign_key: "id_proteccion", validate: true
	belongs_to :regionsjr, foreign_key: "id_regionsjr", validate: true
	belongs_to :salida, class_name: "Ubicacion", foreign_key: "id_salida", 
		validate: true
	belongs_to :statusmigratorio, foreign_key: "id_statusmigratorio", 
		validate: true

	self.primary_key = :id_caso

	validates_presence_of :fecharec
	validates_presence_of :asesor
  validates_presence_of :regionsjr

  validate :sitios_diferentes
  def sitios_diferentes
    if llegada.present? && salida.present? && id_llegada == id_salida
      errors.add(:llegada, " debe ser diferente al sitio de salida")
    end
  end

  validate :llegada_posterior_a_salida
  def llegada_posterior_a_salida
    if fechallegada.present? && fechasalida.present? && fechallegada<fechasalida
      errors.add(:fechallegada, " debe ser posterior a la fecha de salida")
    end
  end

  validate :rol_usuario
  def rol_usuario
		if (usuario.regionsjr_id != regionsjr.id && regionsjr.id != 1)
			errors.add(:usuario, "Asesor debe ser de oficina")
		end
    if (caso.current_usuario.rol == Ability::ROLSIST || 
         caso.current_usuario.rol == Ability::ROLCOOR || 
         caso.current_usuario.rol == Ability::ROLANALI)
        if (regionsjr.id != caso.current_usuario.regionsjr_id)
            errors.add(:regionsjr, "Solo puede editar casos de su oficina")
        end
    end
  end

end
