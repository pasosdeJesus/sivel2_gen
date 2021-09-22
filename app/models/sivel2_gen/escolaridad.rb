
require 'sivel2_gen/concerns/models/escolaridad'

module Sivel2Gen
  class Escolaridad < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Escolaridad
  end
end
