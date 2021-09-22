
require 'sivel2_gen/concerns/models/consexpcaso'

module Sivel2Gen 
  class Consexpcaso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Consexpcaso
  end
end
