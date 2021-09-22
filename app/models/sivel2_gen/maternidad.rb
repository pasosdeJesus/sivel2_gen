
require 'sivel2_gen/concerns/models/maternidad'

module Sivel2Gen
  class Maternidad < ActiveRecord::Base
        include Sivel2Gen::Concerns::Models::Maternidad
  end
end
