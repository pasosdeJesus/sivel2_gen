# encoding: UTF-8
module Sivel2Gen
  class Region < ActiveRecord::Base
    include Sip::Basica

    has_many :caso_region, foreign_key: "id_region", 
      dependent: :delete_all, class_name: 'Sivel2Gen::CasoRegion'
    has_many :caso, through: :caso_region, class_name: 'Sivel2Gen::Caso'

    has_many :region_departamento, dependent: :delete_all,
      class_name: 'Sivel2Gen::DepartamentoRegion',
      foreign_key: 'region_id'
    has_many :departamento, through: :region_departamento,
      class_name: 'Sip::Departamento'

    has_many :region_municipio, dependent: :delete_all,
      class_name: 'Sivel2Gen::MunicipioRegion',
      foreign_key: 'region_id'
    has_many :municipio, through: :region_municipio,
      class_name: 'Sip::Municipio'
  end
end
