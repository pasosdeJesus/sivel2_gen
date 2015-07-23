# encoding: UTF-8

require 'sivel2_gen/concerns/models/anexo'

module Sip
  class Anexo < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Anexo
  end
end
