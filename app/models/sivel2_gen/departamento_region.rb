# encoding: UTF-8

require 'sivel2_gen/concerns/models/departamento_region'

module Sivel2Gen 
  class DepartamentoRegion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::DepartamentoRegion
  end
end
