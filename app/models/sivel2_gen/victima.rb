# encoding: UTF-8

require 'sivel2_gen/concerns/models/victima'

module Sivel2Gen
  class Victima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Victima
  end
end
