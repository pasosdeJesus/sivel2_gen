# encoding: UTF-8

require 'sivel2_gen/concerns/models/persona'

module Sivel2Gen
  class Persona < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Persona
  end
end
