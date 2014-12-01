# encoding: UTF-8
module Sivel2Gen
  class CasoPresponsable < ActiveRecord::Base
    belongs_to :caso, foreign_key: "id_caso", validate: true,
      class_name: 'Sivel2Gen::Caso'
    belongs_to :presponsable, foreign_key: "id_presponsable", validate: true, 
      class_name: 'Sivel2Gen::Presponsable'
    accepts_nested_attributes_for :presponsable, :reject_if => :all_blank
  end
end
