# encoding: UTF-8
module Sivel2Gen
  class AntecedenteCaso < ActiveRecord::Base
    belongs_to :antecedente, foreign_key: "id_antecedente", validate: true, 
      class_name: 'Sivel2Gen::Antecedente'
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
  end
end
