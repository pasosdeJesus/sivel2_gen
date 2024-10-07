
require 'sivel2_gen/concerns/models/antecedente'

module Sivel2Gen
  # Tabla básica Antecedente
  class Antecedente < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Antecedente
  end
end
