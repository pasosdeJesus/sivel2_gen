# frozen_string_literal: true

module Sivel2Gen
  # Tabla básica Iglesia
  class Iglesia < ActiveRecord::Base
    include Msip::Basica
  end
end
