# encoding: UTF-8

require 'sivel2_gen/concerns/models/persona_trelacion'

module Sip
  class PersonaTrelacion < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::PersonaTrelacion
  end
end
