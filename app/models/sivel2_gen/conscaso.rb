# encoding: UTF-8

require 'sivel2_gen/concerns/models/conscaso'

module Sivel2Gen 
  class Conscaso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Conscaso
  end
end
