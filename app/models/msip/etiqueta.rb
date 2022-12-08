
require 'sivel2_gen/concerns/models/etiqueta'

module Msip
  class Etiqueta < ActiveRecord::Base
        include Sivel2Gen::Concerns::Models::Etiqueta
  end
end
