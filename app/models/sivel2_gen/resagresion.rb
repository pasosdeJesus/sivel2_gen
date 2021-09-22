
require 'sivel2_gen/concerns/models/resagresion'

module Sivel2Gen
  class Resagresion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Resagresion
  end
end
