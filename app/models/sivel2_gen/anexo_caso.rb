
require 'sivel2_gen/concerns/models/anexo_caso'

module Sivel2Gen
  class AnexoCaso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::AnexoCaso
  end
end
