
require 'sivel2_gen/concerns/models/fotra'

module Sivel2Gen
  class Fotra < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Fotra
  end
end
