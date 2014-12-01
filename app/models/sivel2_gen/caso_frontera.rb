# encoding: UTF-8
module Sivel2Gen
  class CasoFrontera < ActiveRecord::Base
    belongs_to :frontera, foreign_key: "id_frontera", validate: true,
      class_name: 'Sivel2Gen::Frontera'
    belongs_to :caso, foreign_key: "id_caso", validate: true,
      class_name: 'Sivel2Gen::Caso'
  end
end
