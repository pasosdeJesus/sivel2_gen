
require 'sivel2_gen/concerns/models/contexto'

module Sivel2Gen
  class Contexto < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Contexto
  end
end
