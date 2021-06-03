# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module DepartamentoRegion 
        extend ActiveSupport::Concern

        included do
          belongs_to :region, class_name: 'Sivel2Gen::Region', 
            foreign_key: 'region_id'
          belongs_to :departamento, 
            class_name: 'Sip::Departamento',
            foreign_key: 'departamento_id'
        end
      end
    end
  end
end
