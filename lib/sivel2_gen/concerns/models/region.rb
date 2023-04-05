
module Sivel2Gen
  module Concerns
    module Models
      module Region
        extend ActiveSupport::Concern

        include Msip::Basica
        included do

          has_many :caso_region, foreign_key: "region_id", 
            dependent: :delete_all, class_name: 'Sivel2Gen::CasoRegion'
          has_many :caso, through: :caso_region, class_name: 'Sivel2Gen::Caso'

          has_many :region_departamento, dependent: :delete_all,
            class_name: 'Sivel2Gen::DepartamentoRegion',
            foreign_key: 'region_id'
          has_many :departamento, through: :region_departamento,
            class_name: 'Msip::Departamento'

          has_many :region_municipio, dependent: :delete_all,
            class_name: 'Sivel2Gen::MunicipioRegion',
            foreign_key: 'region_id'
          has_many :municipio, through: :region_municipio,
            class_name: 'Msip::Municipio'

        end


        class_methods do

          def calcula_de_depmun(departamento_id, municipio_id)
            if departamento_id && 
                Sivel2Gen::DepartamentoRegion.where(
                  departamento_id: departamento_id).count > 0
              dr = Sivel2Gen::DepartamentoRegion.
                where(departamento_id: departamento_id).take
              return dr.region
            end
            if municipio_id &&
                Sivel2Gen::MunicipioRegion.where(
                  municipio_id: municipio_id).count > 0
              mr = Sivel2Gen::MunicipioRegion.where(
                municipio_id: municipio_id
              ).take
              return mr.region
            end
            if municipio_id &&
                Msip::Municipio.where(id: municipio_id).count > 0
              dm = Msip::Municipio.find(municipio_id)
              if Sivel2Gen::DepartamentoRegion.where(
                  departamento_id: dm.departamento_id).count > 0
                dr = Sivel2Gen::DepartamentoRegion.
                  where(departamento_id: dm.departamento_id).take
                return dr.region
              end
            end


            return nil
          end # calcula_de_depmun

        end # class_methods

      end
    end
  end
end
