# encoding: UTF-8

require 'sivel2_gen/concerns/models/sectorsocial'

module Sivel2Gen
  class Sectorsocial < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Sectorsocial
  end
end
