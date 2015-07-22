# encoding: UTF-8

require 'sip/concerns/models/fuenteprensa'   

module Sip
  class Fuenteprensa < ActiveRecord::Base
    include Sip::Concerns::Models::Fuenteprensa

    has_many :caso_fuenteprensa, foreign_key: "fuenteprensa_id", 
      validate: true, dependent: :destroy, class_name: 'Sivel2Gen::CasoFuenteprensa'
    has_many :anexo, foreign_key: "fuenteprensa_id", validate: true, 
      class_name: 'Sivel2Gen::AnexoCaso'
  end
end
