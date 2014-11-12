# encoding: UTF-8
module Sivel2Gen
  class CasoFotra < ActiveRecord::Base
    belongs_to :caso, foreign_key: "id_caso", validate: true, 
      class_name: 'Sivel2Gen::Caso'
    belongs_to :fotra, foreign_key: "id_fotra", validate: true,
      class_name: 'Sivel2Gen::Fotra'
  end
end
