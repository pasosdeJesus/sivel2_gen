
require 'sivel2_gen/concerns/models/caso_categoria_presponsable'

module Sivel2Gen
  class CasoCategoriaPresponsable < ActiveRecord::Base
   include Sivel2Gen::Concerns::Models::CasoCategoriaPresponsable 
  end
end
