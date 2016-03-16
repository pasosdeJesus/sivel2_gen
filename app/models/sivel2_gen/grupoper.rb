# encoding: UTF-8

require 'sivel2_gen/concerns/models/grupoper'

module Sivel2Gen
  class Grupoper < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Grupoper
  end
end
