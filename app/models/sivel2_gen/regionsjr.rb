# encoding: UTF-8


require 'sivel2_gen/concerns/models/regionsjr'

module Sivel2Gen
  class Regionsjr < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Regionsjr
  end
end
