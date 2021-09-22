
require 'sivel2_gen/concerns/models/actocolectivo'

module Sivel2Gen
  class Actocolectivo < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Actocolectivo
  end
end
