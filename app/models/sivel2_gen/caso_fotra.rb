
require 'sivel2_gen/concerns/models/caso_fotra'

module Sivel2Gen
  class CasoFotra < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::CasoFotra
  end
end
