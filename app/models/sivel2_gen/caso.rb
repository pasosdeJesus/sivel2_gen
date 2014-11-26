# encoding: UTF-8

require 'sivel2_gen/concerns/models/caso'

module Sivel2Gen 
  class Caso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Caso
  end
end
