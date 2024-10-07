
require 'sivel2_gen/concerns/models/victimacolectiva'

module Sivel2Gen
  # Víctima colectiva en un caos. Relaciona un grupo de personas con un caso. El
  # mismo grupo de personas podría estar en varios casos.
  class Victimacolectiva < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Victimacolectiva
  end
end
