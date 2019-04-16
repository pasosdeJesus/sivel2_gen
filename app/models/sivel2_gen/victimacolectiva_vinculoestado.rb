# encoding: UTF-8

require 'sivel2_gen/concerns/models/victimacolectiva_vinculoestado'

module Sivel2Gen
  class Victima < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::VictimacolectivaVinculoestado
  end
end
