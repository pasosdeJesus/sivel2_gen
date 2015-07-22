# encoding: UTF-8

require 'sivel2_gen/concerns/models/fuenteprensa'   

module Sip
  class Fuenteprensa < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Fuenteprensa
  end
end
