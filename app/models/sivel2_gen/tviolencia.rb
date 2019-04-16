# encoding: UTF-8

require 'sivel2_gen/concerns/models/tviolencia'

module Sivel2Gen
  class Tviolencia < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Tviolencia
  end
end
