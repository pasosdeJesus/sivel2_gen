require 'sivel2_gen/concerns/models/region'

module Sivel2Gen
  class Region < ActiveRecord::Base

        include Sivel2Gen::Concerns::Models::Region
  end
end
