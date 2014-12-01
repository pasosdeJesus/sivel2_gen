# encoding: UTF-8
module Sivel2Gen
  class Fotra < ActiveRecord::Base
    has_many :caso_fotra, foreign_key: "id_fotra", validate: true,
      class_name: 'Sivel2Gen::Fotra'
    has_many :anexo, foreign_key: "id_fotra", validate: true,
      class_name: 'Sivel2Gen::Anexo'
  end
end
