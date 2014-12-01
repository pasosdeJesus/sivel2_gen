# encoding: UTF-8
module Sivel2Gen
  class Vinculoestado < ActiveRecord::Base
    include Basica

    has_many :comunidad_vinculoestado, foreign_key: "id_vinculoestado", 
      validate: true, class_name: 'Sivel2Gen::ComunidadVinculoestado'
    has_many :victima, foreign_key: "id_vinculoestado", 
      class_name: 'Sivel2Gen::Victima'
  end
end
