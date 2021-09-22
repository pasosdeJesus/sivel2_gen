
require 'sivel2_gen/concerns/models/municipio_region'

module Sivel2Gen 
  class MunicipioRegion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::MunicipioRegion
  end
end
