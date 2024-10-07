
require 'sivel2_gen/concerns/models/anexo_caso'

module Sivel2Gen
  # Relación n:n entre casos y anexo
  class AnexoCaso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::AnexoCaso
  end
end
