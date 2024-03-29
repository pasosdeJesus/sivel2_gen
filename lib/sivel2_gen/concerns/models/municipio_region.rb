
module Sivel2Gen
  module Concerns
    module Models
      module MunicipioRegion 
        extend ActiveSupport::Concern

        included do
          belongs_to :region, class_name: 'Sivel2Gen::Region', 
            foreign_key: 'region_id', optional: false
          belongs_to :municipio, 
            class_name: 'Msip::Municipio',
            foreign_key: 'municipio_id', optional: false
        end
      end
    end
  end
end
