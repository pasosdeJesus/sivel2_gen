
module Sivel2Gen
  module Concerns
    module Models
      module DepartamentoRegion 
        extend ActiveSupport::Concern

        included do
          belongs_to :region, class_name: 'Sivel2Gen::Region', 
            foreign_key: 'region_id', optional: true
          belongs_to :departamento, 
            class_name: 'Sip::Departamento',
            foreign_key: 'departamento_id', optional: true
        end
      end
    end
  end
end
