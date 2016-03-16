# encoding: UTF-8

require 'sivel2_gen/concerns/models/grupoper'

module Sivel2Gen
  class Grupoper < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Grupoper
  end
end
#    has_many :actocolectivo, foreign_key: "id_grupoper", validate: true,
#      class_name: 'Sivel2Gen::Actocolectivo'
#    has_many :antecedente_comunidad, foreign_key: "id_grupoper", validate: true,
#      class_name: 'Sivel2Gen::AntecedenteComunidad'
#    has_many :comunidad_filiacion, foreign_key: "id_grupoper", validate: true,
#      class_name: 'Sivel2Gen::ComunidadFiliacion'
#    has_many :comunidad_organizacion, foreign_key: "id_grupoper", 
#      validate: true,class_name: 'Sivel2Gen::ComunidadOrganizacion'
#    has_many :comunidad_profesion, foreign_key: "id_grupoper", validate: true, 
#      class_name: 'Sivel2Gen::ComunidadProfesion'
#    has_many :comunidad_rangoedad, foreign_key: "id_grupoper", 
#      validate: true, class_name: 'Sivel2Gen::ComunidadRangoedad'
#    has_many :comunidad_sectorsocial, foreign_key: "id_grupoper", 
#      validate: true, class_name: 'Sivel2Gen::ComunidadSectorsocial'
#    has_many :comunidad_vinculoestado, foreign_key: "id_grupoper", 
#      validate: true, class_name: 'Sivel2Gen::ComunidadVinculoestado'
#    has_many :victimacolectiva, foreign_key: "id_grupoper", validate: true, 
#      class_name: 'Sivel2Gen::Victimacolectiva'
