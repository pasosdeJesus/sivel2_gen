# encoding: UTF-8

require 'sivel2_gen/concerns/models/actividadoficio'

module Sivel2Gen
  class Actividadoficio < ActiveRecord::Base
    include Sivel2Gen::Concerns::Models::Actividadoficio
  end
end
