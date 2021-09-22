
require 'sivel2_gen/concerns/models/vinculoestado'

module Sivel2Gen
  class Vinculoestado < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Vinculoestado
  end
end
