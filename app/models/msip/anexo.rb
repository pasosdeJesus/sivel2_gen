require 'sivel2_gen/concerns/models/anexo'

module Msip
  class Anexo < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Anexo
  end
end
