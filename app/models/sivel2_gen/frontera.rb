# encoding: UTF-8
module Sivel2Gen
  class Frontera < ActiveRecord::Base
    include Sip::Basica

    has_many :caso_frontera, foreign_key: "id_frontera", validate: true, 
      class_name: 'Sivel2Gen::CasoFrontera'
    has_many :caso, through: :caso_frontera, class_name: 'Sivel2Gen::Caso'
  end
end
