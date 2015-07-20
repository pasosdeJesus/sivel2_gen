# encoding: UTF-8
#
require 'sivel2_gen/concerns/models/acto'

module Sivel2Gen
  class Categoria < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Categoria
  end
end
