# encoding: UTF-8
module Sivel2Gen
  class Caso < ActiveRecord::Base

    @current_usuario = nil
    attr_accessor :current_usuario

    # Ordenados por foreign_key para facilitar comparar con esquema en base
    has_many :acto, foreign_key: "id_caso", validate: true, dependent: :destroy,
      class_name: 'Sivel2Gen::Acto'
    accepts_nested_attributes_for :acto, allow_destroy: true, 
      reject_if: :all_blank
    has_many :actocolectivo, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::Actocolectivo'
    has_many :anexo, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::Anexo'
    accepts_nested_attributes_for :anexo, allow_destroy: true, 
      reject_if: :all_blank
    has_many :antecedente_caso, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::AntecedneteCaso'
    has_many :antecedente_comunidad, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::AntecedenteComunidad'
    has_many :antecedente_victima, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::AntecedenteVictima'
    has_many :caso_categoria_presponsable, foreign_key: "id_caso", 
      validate: true, dependent: :destroy, 
      class_name: 'Sivel2Gen::CasoCategoriaPresponsable'
    has_many :caso_contexto, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::CasoContexto'
    has_many :caso_etiqueta, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::CasoEtiqueta'
    accepts_nested_attributes_for :caso_etiqueta, allow_destroy: true, 
      reject_if: :all_blank
    has_many :caso_ffrecuente, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::CasoFfrecuente'
    has_many :caso_fotra, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::CasoFotra'
    has_many :caso_frontera, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::CasoFrontera'
    has_many :frontera, through: :caso_frontera, 
      class_name: 'Sivel2Gen::Frontera'
    has_many :caso_presponsable, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::CasoPresponsable'
    has_many :presponsable, through: :caso_presponsable, 
      class_name: 'Sivel2Gen::Presponsable'
    accepts_nested_attributes_for :caso_presponsable, 
      allow_destroy: true, reject_if: :all_blank
    has_many :caso_region, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::CasoRegion'
    has_many :region, through: :caso_region, class_name: 'Sivel2Gen::Region'
    has_many :caso_usuario, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::CasoUsuario'

    has_many :comunidad_filiacion, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::ComunidadFiliacion'
    has_many :comunidad_organizacion, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::ComunidadOrganizacion'
    has_many :comunidad_profesion, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::ComunidadProfesion'
    has_many :comunidad_rangoedad, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::ComunidadRangoedad'
    has_many :comunidad_sectorsocial, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::ComunidadSectorsocial'
    has_many :comunidad_vinculoestado, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::ComunidadVinculoestado'
    has_many :ubicacion, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::Ubicacion'
    accepts_nested_attributes_for :ubicacion, allow_destroy: true, 
      reject_if: :all_blank
    has_many :desplazamiento, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::Desplazamiento'
    accepts_nested_attributes_for :desplazamiento , allow_destroy: true, 
      reject_if: :all_blank
    has_many :victima,  foreign_key: "id_caso", dependent: :destroy, 
      class_name: 'Sivel2Gen::Victima'
    has_many :persona, :through => :victima, class_name: 'Sivel2Gen::Persona'
    accepts_nested_attributes_for :persona,  reject_if: :all_blank
    accepts_nested_attributes_for :victima, allow_destroy: true, 
      reject_if: :all_blank
    has_many :victimacolectiva, foreign_key: "id_caso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::Victimacolectiva' 

    has_one :sivel2_gen_conscaso, foreign_key: "caso_id"

    belongs_to :intervalo, foreign_key: "id_intervalo", 
      validate: true, class_name: 'Sivel2Gen::Intervalo'

    validates_presence_of :fecha

    validate :rol_usuario
    def rol_usuario
      if (current_usuario && current_usuario.rol != Ability::ROLADMIN &&
          current_usuario.rol != Ability::ROLANALI) 
        errors.add(:id, "Rol de usuario no apropiado para editar")
      end
    end

    def self.refresca_conscaso
      if !ActiveRecord::Base.connection.table_exists? 'sivel2_gen_conscaso'
        ActiveRecord::Base.connection.execute("CREATE OR REPLACE 
        VIEW sivel2_gen_conscaso1 AS
        SELECT caso.id as caso_id, caso.fecha, caso.memo, 
        ARRAY_TO_STRING(ARRAY(SELECT departamento.nombre ||  ' / ' 
        || municipio.nombre 
        FROM sivel2_gen_ubicacion AS ubicacion LEFT JOIN sivel2_gen_departamento AS departamento ON (
        ubicacion.id_pais = departamento.id_pais
        AND ubicacion.id_departamento = departamento.id)
        LEFT JOIN sivel2_gen_municipio AS municipio ON (ubicacion.id_pais=municipio.id_pais
        AND ubicacion.id_departamento=municipio.id_departamento
        AND ubicacion.id_municipio=municipio.id) 
        WHERE ubicacion.id_caso=caso.id), ', ')
        AS ubicaciones, 
        ARRAY_TO_STRING(ARRAY(SELECT nombres || ' ' || apellidos 
        FROM sivel2_gen_persona AS persona, 
        sivel2_gen_victima AS victima WHERE persona.id=victima.id_persona 
        AND victima.id_caso=caso.id), ', ')
        AS victimas, 
        ARRAY_TO_STRING(ARRAY(SELECT nombre 
        FROM sivel2_gen_presponsable AS presponsable, 
        sivel2_gen_caso_presponsable AS caso_presponsable
        WHERE presponsable.id=caso_presponsable.id_presponsable
        AND caso_presponsable.id_caso=caso.id), ', ')
        AS presponsables, 
        ARRAY_TO_STRING(ARRAY(SELECT categoria.id_tviolencia || ':' || 
        categoria.id_supracategoria || ':' || categoria.id || ' ' ||
        categoria.nombre FROM sivel2_gen_categoria AS categoria, 
        sivel2_gen_acto AS acto
        WHERE categoria.id=acto.id_categoria
        AND acto.id_caso=caso.id), ', ')
        AS tipificacion
        FROM sivel2_gen_caso AS caso;")
        ActiveRecord::Base.connection.execute(
          "CREATE MATERIALIZED VIEW sivel2_gen_conscaso AS
        SELECT caso_id, fecha, memo, ubicaciones, victimas, 
        presponsables, tipificacion, 
        to_tsvector('spanish', unaccent(caso_id || ' ' || 
        replace(cast(fecha AS varchar), '-', ' ') 
        || ' ' || memo || ' ' || ubicaciones || ' ' || 
         victimas || ' ' || presponsables || ' ' || tipificacion)) as q
        FROM sivel2_gen_conscaso1");
        ActiveRecord::Base.connection.execute(
          "CREATE INDEX busca_sivel2_gen_conscaso ON sivel2_gen_conscaso USING gin(q);"
        )
      else
        ActiveRecord::Base.connection.execute(
          'REFRESH MATERIALIZED VIEW sivel2_gen_conscaso'
        )
      end
    end

  end
end
