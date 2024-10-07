
require 'sivel2_gen/concerns/models/departamento_region'

module Sivel2Gen 
  # Relación n:n entre Departamento y Región
  class DepartamentoRegion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::DepartamentoRegion
  end
end
