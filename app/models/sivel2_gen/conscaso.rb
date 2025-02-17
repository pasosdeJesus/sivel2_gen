# frozen_string_literal: true

require "sivel2_gen/concerns/models/conscaso"

module Sivel2Gen
  # Vista conscaso con los datos que se presentan en el listado de casos
  class Conscaso < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Conscaso
  end
end
