# frozen_string_literal: true

require "sivel2_gen/concerns/models/consexpcaso"

module Sivel2Gen
  # Vista consexpcaso con datos adicionales a los de listado de casos
  class Consexpcaso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Consexpcaso
  end
end
