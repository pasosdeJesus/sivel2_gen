# encoding: UTF-8
module Sivel2Gen
  class Pconsolidado < ActiveRecord::Base
    include Sip::Basica

    has_many :categoria, foreign_key: "id_pconsolidado", validate: true, 
      class_name: 'Sivel2Gen::Categoria'
    accepts_nested_attributes_for :categoria, allow_destroy: true, 
      reject_if: :all_blank


#    def categoria_ids
#      self.categoria.inject("") { |memo, m|
#        (memo == "" ? "" : memo + ", ") + m.id.to_s
#      }
#    end

    def presenta_nombre
      self.rotulo
    end
  end
end
