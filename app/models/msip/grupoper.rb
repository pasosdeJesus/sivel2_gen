
require 'sivel2_gen/concerns/models/grupoper'

module Msip
  class Grupoper < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Grupoper
  end
end
