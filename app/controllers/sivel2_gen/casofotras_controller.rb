# encoding: UTF-8
require 'date'

require 'sivel2_gen/concerns/controllers/casofotras_controller'

module Sivel2Gen
  class CasofotrasController < ApplicationController
    include Sivel2Gen::Concerns::Controllers::CasofotrasController
  end
end
