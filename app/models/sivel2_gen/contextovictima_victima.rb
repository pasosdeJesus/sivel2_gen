# encoding: UTF-8

require 'sivel2_gen/concerns/models/contextovictima_victima'

module Sivel2Gen
  class ContextovictimaVictima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::ContextovictimaVictima
  end
end
