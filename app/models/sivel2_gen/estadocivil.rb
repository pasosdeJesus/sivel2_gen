# encoding: UTF-8

require 'sivel2_gen/concerns/models/estadocivil'

module Sivel2Gen
  class Estadocivil < ActiveRecord::Base
        include Sivel2Gen::Concerns::Models::Estadocivil
  end
end
