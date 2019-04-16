# encoding: UTF-8

require 'sivel2_gen/concerns/models/caso_presponsable'

module Sivel2Gen
  class CasoPresponsable < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::CasoPresponsable
  end
end
