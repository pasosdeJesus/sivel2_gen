# encoding: UTF-8

require 'sivel2_gen/concerns/models/caso_etiqueta'

module Sivel2Gen
  class CasoEtiqueta < ActiveRecord::Base

    include Sivel2Gen::Concerns::Models::CasoEtiqueta

  end
end
