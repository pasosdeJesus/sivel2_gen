
require 'sivel2_gen/concerns/models/contextovictima'

module Sivel2Gen
  class Contextovictima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Contextovictima
  end
end
