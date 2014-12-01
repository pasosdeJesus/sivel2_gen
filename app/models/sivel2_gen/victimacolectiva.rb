# encoding: UTF-8
module Sivel2Gen
  class Victimacolectiva < ActiveRecord::Base
    belongs_to :grupoper, foreign_key: "id_grupoper", validate: true,
      class_name: 'Sivel2Gen::Grupoper'
    belongs_to :caso, foreign_key: "id_caso", validate: true,
      class_name: 'Sivel2Gen::Caso'
    belongs_to :presponsable, foreign_key: "organizacionarmada", 
      validate: true, class_name: 'Sivel2Gen::Presponsable'
  end
end
