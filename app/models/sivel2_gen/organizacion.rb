
require 'sivel2_gen/concerns/models/organizacion'

module Sivel2Gen
  class Organizacion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Organizacion
  end
end
