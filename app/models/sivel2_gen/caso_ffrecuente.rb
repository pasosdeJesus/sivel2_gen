# encoding: UTF-8
module Sivel2Gen
  class CasoFfrecuente < ActiveRecord::Base
    has_many :anexo, foreign_key: "id_anexo", validate: true, 
      class_name: 'Sivel2Gen::Anexo'
    belongs_to :ffrecuente, foreign_key: "id_ffrecuente", validate: true, 
      class_name: 'Sivel2Gen::Ffrecuente'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end
