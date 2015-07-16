# encoding: UTF-8
module Sivel2Gen
  class CasoFuenteprensa < ActiveRecord::Base
    has_many :anexo, foreign_key: "id_anexo", validate: true, 
      class_name: 'Sivel2Gen::Anexo'
    belongs_to :fuenteprensa, foreign_key: "fuenteprensa_id", validate: true, 
      class_name: 'Sip::Fuenteprensa'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end
