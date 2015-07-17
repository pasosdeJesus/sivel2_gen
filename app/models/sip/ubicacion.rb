# encoding: UTF-8

require 'sivel2_gen/concerns/models/ubicacion'

module Sip
  class Ubicacion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Ubicacion
  end
end
