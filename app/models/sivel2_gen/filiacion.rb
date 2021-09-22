
require 'sivel2_gen/concerns/models/filiacion'

module Sivel2Gen
  class Filiacion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Filiacion
  end
end
