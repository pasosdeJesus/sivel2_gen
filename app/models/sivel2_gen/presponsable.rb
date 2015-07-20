# encoding: UTF-8

require 'sivel2_gen/concerns/models/presponsable'

module Sivel2Gen
  class Presponsable < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Presponsable
  end
end
