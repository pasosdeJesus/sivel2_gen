
require 'sivel2_gen/concerns/models/grupoper'

module Sip
  class Grupoper < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Grupoper
  end
end
