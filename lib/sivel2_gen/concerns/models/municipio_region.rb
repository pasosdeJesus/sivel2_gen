# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module MunicipioRegion 
        extend ActiveSupport::Concern

        included do
          belongs_to :region, class_name: 'Sivel2Gen::Region', 
            foreign_key: 'region_id'
          belongs_to :municipio, 
            class_name: 'Sip::Municipio',
            foreign_key: 'municipio_id'
        end
      end
    end
  end
end
