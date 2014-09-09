# encoding: UTF-8
class Caso < ActiveRecord::Base

  @current_usuario = nil
  attr_accessor :current_usuario

	# Ordenados por foreign_key para facilitar comparar con esquema en base
	has_many :acto, foreign_key: "id_caso", validate: true, dependent: :destroy
	accepts_nested_attributes_for :acto, allow_destroy: true, 
    reject_if: :all_blank
	has_many :actocolectivo, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :anexo, foreign_key: "id_caso", validate: true, dependent: :destroy
	accepts_nested_attributes_for :anexo, allow_destroy: true, 
    reject_if: :all_blank
	has_many :antecedente_caso, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :antecedente_comunidad, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :antecedente_victima, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :caso_categoria_presponsable, foreign_key: "id_caso", 
    validate: true, dependent: :destroy
	has_many :caso_contexto, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :caso_etiqueta, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	accepts_nested_attributes_for :caso_etiqueta, allow_destroy: true, 
    reject_if: :all_blank
	has_many :caso_ffrecuente, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :caso_fotra, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :caso_frontera, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :frontera, through: :caso_frontera
	has_many :caso_presponsable, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :presponsable, through: :caso_presponsable
	accepts_nested_attributes_for :caso_presponsable, allow_destroy: true, 
    reject_if: :all_blank
	has_many :caso_region, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :region, through: :caso_region
	has_many :caso_usuario, foreign_key: "id_caso", validate: true, 
    dependent: :destroy

	has_many :comunidad_filiacion, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :comunidad_organizacion, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :comunidad_profesion, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :comunidad_rangoedad, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :comunidad_sectorsocial, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	has_many :comunidad_vinculoestado, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	#has_many :proceso, foreign_key: "id_caso", validate: true, dependent: :destroy
	has_many :ubicacion, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	accepts_nested_attributes_for :ubicacion, allow_destroy: true, 
    reject_if: :all_blank
	has_many :desplazamiento, foreign_key: "id_caso", validate: true, 
    dependent: :destroy
	accepts_nested_attributes_for :desplazamiento , allow_destroy: true, 
    reject_if: :all_blank
	has_many :victima,  foreign_key: "id_caso", dependent: :destroy
	has_many :persona, :through => :victima
	accepts_nested_attributes_for :persona,  reject_if: :all_blank
	accepts_nested_attributes_for :victima, allow_destroy: true, 
    reject_if: :all_blank
	has_many :victimacolectiva, foreign_key: "id_caso", validate: true, 
    dependent: :destroy

	belongs_to :intervalo, foreign_key: "id_intervalo", validate: true

	validates_presence_of :fecha

  validate :rol_usuario
  def rol_usuario
    if (current_usuario && current_usuario.rol != Ability::ROLADMIN &&
        current_usuario.rol != Ability::ROLANALI) 
      errors.add(:id, "Rol de usuario no apropiado para editar")
    end
  end

end
