# encoding: UTF-8
module Sivel2Gen
  class Pconsolidado < ActiveRecord::Base
    include Sip::Basica

    has_many :categoria, foreign_key: "id_pconsolidado", validate: true, 
      class_name: 'Sivel2Gen::Categoria'
  end
end
