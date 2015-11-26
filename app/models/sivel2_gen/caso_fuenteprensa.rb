# encoding: UTF-8

require 'sivel2_gen/concerns/models/caso_fuenteprensa'

module Sivel2Gen
  class CasoFuenteprensa < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::CasoFuenteprensa
  end
end
