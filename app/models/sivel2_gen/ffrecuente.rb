# encoding: UTF-8
module Sivel2Gen
  class Ffrecuente < ActiveRecord::Base
    has_many :caso_ffrecuente, foreign_key: "id_ffrecuente", 
      validate: true, dependent: :destroy, class_name: 'Sivel2Gen::Caso'
    has_many :anexo, foreign_key: "id_ffrecuente", validate: true, 
      class_name: 'Sivel2Gen::Anexo'
  end
end
