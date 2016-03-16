# encoding: UTF-8
module Sivel2Gen
  class Antecedente < ActiveRecord::Base
    has_many :antecedente_caso, foreign_key: "id_antecedente", 
      validate: true, class_name: 'Sivel2Gen::AntecedenteCaso'
    has_many :antecedente_victimacolectiva, foreign_key: "id_antecedente", 
      validate: true, class_name: 'Sivel2Gen::AntecedenteVictimacolectiva'
    has_many :antecedente_victima, foreign_key: "id_antecedente", 
      validate: true, class_name: 'Sivel2Gen::AnecedenteVictima'
  end
end
