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

  has_one :conscaso, foreign_key: "caso_id"

  belongs_to :intervalo, foreign_key: "id_intervalo", validate: true

  validates_presence_of :fecha

  validate :rol_usuario
  def rol_usuario
    if (current_usuario && current_usuario.rol != Ability::ROLADMIN &&
        current_usuario.rol != Ability::ROLANALI) 
      errors.add(:id, "Rol de usuario no apropiado para editar")
    end
  end

  def self.refresca_conscaso
    if !ActiveRecord::Base.connection.table_exists? 'conscaso'
      ActiveRecord::Base.connection.execute("CREATE OR REPLACE VIEW conscaso1 AS
        SELECT caso.id as caso_id, caso.fecha, caso.memo, 
        ARRAY_TO_STRING(ARRAY(SELECT departamento.nombre ||  ' / ' || municipio.nombre 
        FROM ubicacion LEFT JOIN departamento ON (
        ubicacion.id_pais = departamento.id_pais
        AND ubicacion.id_departamento = departamento.id)
        LEFT JOIN municipio ON (ubicacion.id_pais=municipio.id_pais
        AND ubicacion.id_departamento=municipio.id_departamento
        AND ubicacion.id_municipio=municipio.id) WHERE ubicacion.id_caso=caso.id), ', ')
        AS ubicaciones, 
        ARRAY_TO_STRING(ARRAY(SELECT nombres || ' ' || apellidos FROM persona, 
        victima WHERE persona.id=victima.id_persona AND victima.id_caso=caso.id), ', ')
        AS victimas, 
        ARRAY_TO_STRING(ARRAY(SELECT nombre FROM presponsable, caso_presponsable
        WHERE presponsable.id=caso_presponsable.id_presponsable
        AND caso_presponsable.id_caso=caso.id), ', ')
        AS presponsables, 
        ARRAY_TO_STRING(ARRAY(SELECT categoria.id_tviolencia || ':' || 
        categoria.id_supracategoria || ':' || categoria.id || ' ' ||
        categoria.nombre FROM categoria, acto
        WHERE categoria.id=acto.id_categoria
        AND acto.id_caso=caso.id), ', ')
        AS tipificacion
        FROM caso;")
        ActiveRecord::Base.connection.execute("CREATE MATERIALIZED VIEW conscaso AS
        SELECT caso_id, fecha, memo, ubicaciones, victimas, presponsables, tipificacion, 
        to_tsvector('spanish', unaccent(caso_id || ' ' || replace(cast(fecha AS varchar), '-', ' ') 
         || ' ' || memo || ' ' || ubicaciones || ' ' || victimas || ' ' || presponsables || ' ' || tipificacion)) as q
        FROM conscaso1");
        ActiveRecord::Base.connection.execute("CREATE INDEX busca_conscaso ON conscaso USING gin(q);")
    else
      ActiveRecord::Base.connection.execute('REFRESH MATERIALIZED VIEW conscaso')
    end
  end

end
