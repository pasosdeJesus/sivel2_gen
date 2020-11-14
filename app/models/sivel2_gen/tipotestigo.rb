# encoding: UTF-8

require 'sivel2_gen/concerns/models/tipotestigo'

module Sivel2Gen
  class Tipotestigo < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Tipotestigo
  end
end
