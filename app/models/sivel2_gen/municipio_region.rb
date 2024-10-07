
require 'sivel2_gen/concerns/models/municipio_region'

module Sivel2Gen 
  # Relación n:n entre Municipio y Región
  class MunicipioRegion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::MunicipioRegion
  end
end
