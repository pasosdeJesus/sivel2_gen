# encoding: UTF-8

require 'sivel2_gen/concerns/models/etiqueta'

module Sivel2Gen
  class Etiqueta < ActiveRecord::Base
        include Sivel2Gen::Concerns::Models::Etiqueta
  end
end
