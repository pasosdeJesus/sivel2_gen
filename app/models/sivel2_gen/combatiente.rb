# encoding: UTF-8

require 'sivel2_gen/concerns/models/combatiente'

module Sivel2Gen
  class Combatiente < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Combatiente
  end
end
