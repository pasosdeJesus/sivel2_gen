
require 'sivel2_gen/concerns/models/antecedente'

module Sivel2Gen
  class Antecedente < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Antecedente
  end
end
