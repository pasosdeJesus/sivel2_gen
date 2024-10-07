
require 'sivel2_gen/concerns/models/caso_presponsable'

module Sivel2Gen
  # Relación n:n entre Caso y Presunto Responsable
  class CasoPresponsable < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::CasoPresponsable
  end
end
