# encoding: UTF-8
module Sivel2Gen
  class CasoUsuario < ActiveRecord::Base
    belongs_to :usuario, foreign_key: "id_usuario", validate: true
    belongs_to :caso, foreign_key: "id_caso", validate: true,
       class_name: 'Sivel2Gen::Caso'
  end
end
