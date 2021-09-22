
require 'sivel2_gen/concerns/models/victimacolectiva'

module Sivel2Gen
  class Victimacolectiva < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Victimacolectiva
  end
end
