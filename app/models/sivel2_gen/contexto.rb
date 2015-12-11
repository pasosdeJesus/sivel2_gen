# encoding: UTF-8
module Sivel2Gen
  class Contexto < ActiveRecord::Base
    has_many :caso_contexto, foreign_key: "id_contexto", validate: true, 
      class_name: 'Sivel2Gen::CasoContexto'
  end
end
