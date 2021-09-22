#
require 'sivel2_gen/concerns/models/categoria'

module Sivel2Gen
  class Categoria < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Categoria
  end
end
