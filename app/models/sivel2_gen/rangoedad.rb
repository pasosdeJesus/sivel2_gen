# encoding: UTF-8

require 'sivel2_gen/concerns/models/rangoedad'

module Sivel2Gen
  class Rangoedad < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Rangoedad
  end
end
